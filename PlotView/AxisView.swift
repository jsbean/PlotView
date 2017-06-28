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
}

public protocol VerticalAxisView: AxisView {
    associatedtype Position = VerticalAxisPosition
}

public struct HorizontalAxisPosition {
    public let y: Double
    public let plotLeft: Double
    public let plotRight: Double
}

public protocol HorizontalAxisView: AxisView {
    associatedtype Position = HorizontalAxisPosition
}
