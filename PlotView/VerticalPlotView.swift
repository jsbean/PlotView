//
//  VerticalPlotView.swift
//  PlotView
//
//  Created by James Bean on 6/27/17.
//
//

import PlotModel

public protocol VerticalPlotView: PlotView {
    associatedtype Model: VerticalPlotModel
    var concreteVerticalPosition: (Model.VerticalAxis.Coordinate) -> Double { get }
}
