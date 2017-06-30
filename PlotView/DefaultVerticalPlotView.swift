//
//  DefaultVerticalPlotView.swift
//  PlotView
//
//  Created by James Bean on 6/30/17.
//
//

import GeometryTools
import PathTools
import GraphicsTools
import PlotModel

public struct DefaultPlotConfiguration {
    
    public static var `default` = DefaultPlotConfiguration()
    
    public var lineWidth: Double {
        return 1
    }
    
    public let height: Double
    public let pointColor: Color
    public let linesColor: Color
    public let axisColor: Color
    
    public init(
        height: Double = 40,
        pointColor: Color = .black,
        linesColor: Color = .lightGray,
        axisColor: Color = .red
    )
    {
        self.height = height
        self.pointColor = pointColor
        self.linesColor = linesColor
        self.axisColor = axisColor
    }
}

public struct DefaultVerticalPointModel: PointModel {
    
    public typealias Entity = Double
    public typealias VerticalCoordinate = Double
    public typealias HorizontalCoordinate = Double
    public typealias VerticalAxis = DefaultAxis<Double>
    public typealias HorizontalAxis = DefaultAxis<Double>
    
    // TODO: Remove
    public func stemConnectionPoint(from direction: VerticalDirection, axis: DefaultAxis<Double>) -> Double? {
        return nil
    }
    
    // TODO: Remove
    public func slurConnectionPoint(from direction: VerticalDirection, axis: DefaultAxis<Double>) -> Double? {
        return nil
    }
}

public struct DefaultVerticalPlotModel: VerticalPlotModel {
    public typealias Entity = Double
    public typealias Position = Double
    public typealias Point = DefaultVerticalPointModel
    public let points: [Position: [Point]]
    public let verticalAxis: DefaultAxis<Double>
}

public struct DefaultVerticalPointView {
    // init from model
}

extension DefaultVerticalPointView: Renderable {
    
    public var rendered: StyledPath.Composite {
        fatalError()
    }
}

public struct DefaultVerticalPlotView: VerticalPlotView {
    
    public typealias Model = DefaultVerticalPlotModel
    
    public let axis: DefaultVerticalAxisView
    public let lines: DefaultVerticalPlotLinesCollection
    
    // TODO: Create DefaultVerticalPointView
    public let points: [Int]
    
    public init(
        axis: DefaultVerticalAxisView,
        lines: DefaultVerticalPlotLinesCollection,
        points: [Int]
    )
    {
        self.axis = axis
        self.lines = lines
        self.points = points
    }
    
    public func concreteVerticalPosition(for coordinate: Double) -> Double {
        fatalError()
    }
}

extension DefaultVerticalPlotView: Renderable {
    
    public var components: [Renderable] {
        return [lines, axis]
        //return [lines, axis] + points
    }
}
