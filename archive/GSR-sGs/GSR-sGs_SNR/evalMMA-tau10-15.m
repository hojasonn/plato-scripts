Begin["EvalContext`"]

nbFileName = FileNameJoin[{"/home/jnh201/GSR-sGs/GSR-sGs_SNR/", "GSR-sGs_PLATOv2.3tau-10-15.nb"}];

outputCellPattern = Cell[_, "Output", ___];

cellEval[Cell[b_BoxData, "Input", rest___]] :=
 Cell[
  CellGroupData[{
    Cell[b, "Input", rest],
    Cell[BoxData@ToBoxes@(ToExpression @@ b), "Output"]},
   Open]]

cellEval[x : (_CellGroupData | _Cell | _Notebook)] := cellEval /@ x

cellEval[l_List] := cellEval /@ Cases[l, Except@outputCellPattern, {1}]

cellEval[smthElse_] := smthElse

evaluateNotebook = Export[#, cellEval@Get@#] &;

End[]

EvalContext`evaluateNotebook@EvalContext`nbFileName
