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
    let x: Double
    let plotTop: Double
    let plotBottom: Double
}

public protocol VerticalAxisView: AxisView {
    
    associatedtype Position = VerticalAxisPosition
    var position: VerticalAxisPosition { get }
}

public struct HorizontalAxisPosition {
    let y: Double
    let plotLeft: Double
    let plotRight: Double
}

public protocol HorizontalAxisView: AxisView {
    
    associatedtype Position = HorizontalAxisPosition
    var position: HorizontalAxisPosition { get }
}
