//
//  AxisView.swift
//  PlotView
//
//  Created by James Bean on 6/28/17.
//
//

import PlotModel
import GraphicsTools

public protocol AxisView: Renderable {
    
    associatedtype Position
    associatedtype Configuration
    
    var position: Position { get }
    var configuration: Configuration { get }
}

public struct VerticalAxisPosition {
    
    public let x: Double
    public let plotTop: Double
    public let plotBottom: Double
    
    public init(x: Double, plotTop: Double, plotBottom: Double) {
        self.x = x
        self.plotTop = plotTop
        self.plotBottom = plotBottom
    }
}

public protocol VerticalAxisView: AxisView {
    typealias Position = VerticalAxisPosition
}

public struct HorizontalAxisPosition {
    
    public let y: Double
    public let plotLeft: Double
    public let plotRight: Double
    
    public init(y: Double, plotLeft: Double, plotRight: Double) {
        self.y = y
        self.plotLeft = plotLeft
        self.plotRight = plotRight
    }
}

public protocol HorizontalAxisView: AxisView {
    typealias Position = HorizontalAxisPosition
}
