//
//  DefaultVerticalAxisViewTests.swift
//  PlotView
//
//  Created by James Bean on 6/30/17.
//
//

import XCTest
import GeometryTools
import PathTools
import GraphicsTools
import PlotView

class DefaultVerticalAxisViewTests: XCTestCase {
    
    func testVerticalAxisView() {
        let configuration = DefaultVerticalAxisConfiguration(color: .red)
        let position = VerticalAxisPosition(x: 0, plotTop: 0, plotBottom: 40)
        let axis = DefaultVerticalAxisView(position: position, configuration: configuration)
        let layer = CALayer(axis.rendered)
        layer.frame = CGRect(x: 0, y: 0, width: 0, height: 40)
        layer.renderToPDF(name: "default_vertical_axis")
    }
}
