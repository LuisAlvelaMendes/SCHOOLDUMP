/* 
* Formal specification and verification of a simple method for performing integer division.
* FEUP, MIEIC, MFES, 2019/20.
*/

// Computes the quotient 'q' and remainder 'r' of 
// the integer division of a (non-negative) dividend
// 'n' by a (positive) divisor 'd'.

method abs(n: int) returns (a: int)
  ensures a >= 0;
{
  if n >= 0 
    {return n;}
  else
    {return -n;}
}

method div(n: int, d: int) returns (q: nat, r: nat)
 requires n >=0
 ensures 0 <= r < d && q * d + r == n
{
  q := 0;

  if n >= 0
    {r := n;}
  else
    {r := abs(n);}  
    
  while r >= d
    decreases  r
    invariant q * d + r == n
  {
    q := q + 1;
    r := r - d;
  }
}

// A simple test case
method Main()
{
    var q, r := div(15, 6);
    assert q == 2;
    assert r == 3;
    print "q = ", q, " r=", r, "\n";
}