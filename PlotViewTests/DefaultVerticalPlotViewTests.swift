//
//  DefaultVerticalPlotViewTests.swift
//  PlotView
//
//  Created by James Bean on 6/30/17.
//
//

import XCTest
import GeometryTools
import PathTools
import GraphicsTools
import PlotModel
import PlotView

class DefaultVerticalPlotViewTests: XCTestCase {
    
    func testBuilder() {
        
        let configuration = DefaultPlotConfiguration(
            height: 50,
            pointColor: .darkGray,
            linesColor: .lightGray,
            axisColor: .cadetBlue
        )
        
        let builder = DefaultVerticalPlotView.Builder(configuration: configuration)
        builder.startLines(at: 0)
        builder.stopLines(at: 300)
        let plot = builder.build()
        let layer = CALayer(plot.rendered)
        layer.frame = CGRect(x: 0, y: 0, width: 300, height: 50)
        layer.renderToPDF(name: "default_vertical_plot")
    }
}
