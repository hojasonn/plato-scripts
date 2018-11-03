Begin["EvalContext`"]

nbFileName = FileNameJoin[{"/home/jnh201/GSR-sGs/GSR-sGs_DNR/", "GSR-sGs-DNR_PLATOv3.2-s0.nb"}];

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
