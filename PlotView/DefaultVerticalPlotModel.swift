//
//  DefaultVerticalPlotModel.swift
//  PlotView
//
//  Created by James Bean on 6/30/17.
//
//

import Collections
import PlotModel

// TODO: Move to dn-m/PlotModel
public struct DefaultVerticalPointModel: PointModel {
    
    public typealias Entity = Double
    public typealias VerticalCoordinate = Double
    public typealias HorizontalCoordinate = Double
    public typealias VerticalAxis = DefaultAxis<Double>
    public typealias HorizontalAxis = DefaultAxis<Double>
    
    public var value: Double
    
    public init(_ value: Double) {
        self.value = value
    }
    
    // TODO: Remove
    public func stemConnectionPoint(from direction: VerticalDirection, axis: DefaultAxis<Double>) -> Double? {
        return nil
    }
    
    // TODO: Remove
    public func slurConnectionPoint(from direction: VerticalDirection, axis: DefaultAxis<Double>) -> Double? {
        return nil
    }
}

// TODO: Move to dn-m/PlotModel
public struct DefaultVerticalPlotModel: VerticalPlotModel {
    public typealias Entity = Double
    public typealias Position = Double
    public typealias Point = DefaultVerticalPointModel
    public let verticalAxis = DefaultAxis<Double>()
    public let points: [Position: [Point]]
}

extension DefaultVerticalPlotModel {
    
    public var builder: Builder {
        return Builder()
    }
    
    public final class Builder {
        
        var points: [Position: [DefaultVerticalPointModel]]
        
        public init() {
            self.points = [:]
        }
        
        public func add(_ point: Point, at position: Position) {
            points.safelyAppend(point, toArrayWith: position)
        }
        
        public func build() -> DefaultVerticalPlotModel {
            return DefaultVerticalPlotModel(points: points)
        }
    }
}
