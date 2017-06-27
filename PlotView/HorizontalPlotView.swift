//
//  HorizontalPlotView.swift
//  PlotView
//
//  Created by James Bean on 6/27/17.
//
//

import PlotModel

public protocol HorizontalPlotView: PlotView {
    associatedtype Model: HorizontalPlotModel
    associatedtype VerticalCoordinate = Double
}
