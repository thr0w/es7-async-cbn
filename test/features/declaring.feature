Feature: declaring async functions

Scenario: Declaring [case]

   Given I need to transpile [case]
    When EcmaScript6 at [EcmaScript6.start.line]:[EcmaScript6.start.column] = [EcmaScript6] 
    Then EcmaScript5 at [EcmaScript5.start.line]:[EcmaScript5.start.column] = [EcmaScript5] 
#     And eval fn equals to [result]

Examples:
  case:ID          ┆ EcmaScript6:LOC                          ┆ EcmaScript5:LOC

  async function   ┆ async function divide(a,b)               ┆ function divide(a, b, callback) {
                   ┆ {                                        ┆   callback(null, a / b);
                   ┆   return a/b;                            ┆ }
                   ┆ }                                        ┆

  sync function    ┆ function divide(a,b)                     ┆ function divide(a, b) {
                   ┆ {                                        ┆   return a/b;
                   ┆   return a/b;                            ┆ }
                   ┆ }                                        ┆

  async void       ┆ async function log(m)                    ┆ function log(m, callback) {
    function       ┆ {                                        ┆   console.log(m);
                   ┆   console.log(m);                        ┆   callback();
                   ┆ }                                        ┆ }


  async function   ┆ async function divide(a,b)               ┆ function divide(a, b, callback) {
    with throw     ┆ {                                        ┆   return callback("division by zero");
                   ┆   throw "division by zero";              ┆ }
                   ┆ }                                        ┆


  async function   ┆ async function divide(a,b)               ┆ function divide(a, b, callback) {
    with if        ┆ {                                        ┆   if (b<0)
                   ┆   if (b<0)                               ┆     return callback("division by zero");
                   ┆     throw "division by zero";            ┆   callback(null, a/b);
                   ┆   return a/b;                            ┆ }
                   ┆ }                                        ┆
