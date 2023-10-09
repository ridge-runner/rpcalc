# rpcalc
A four-function calculator using reverse polish notation for entering argurments.

## To install the script on Linux
Add execution permissions:
   `chmod +x rpcalc.bash`

## Useage Instructions
`$ ./rpcalc operand1 operand2 operator`
## Notes
The Multiply operator must be escaped, else an "undefined operator" error is triggered.
  For example:
  `$ ./rpcalc 5 5 '*'`
  Will return 25 as expected.
