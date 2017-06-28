//
//  PlotViewTests.swift
//  PlotView
//
//  Created by James Bean on 6/27/17.
//
//

import XCTest
import Collections
import GraphicsTools
import PlotModel
import PlotView

class PlotViewTests: XCTestCase {
    
    struct PPoint: PointModel {
        typealias Entity = Double
        typealias VerticalCoordinate = Double
        typealias HorizontalCoordinate = Double
        typealias VerticalAxis = DefaultAxis<Double>
        typealias HorizontalAxis = DefaultAxis<Double>
        
        func stemConnectionPoint(from direction: VerticalDirection, axis: DefaultAxis<Double>) -> Double? {
            fatalError()
        }
        
        func slurConnectionPoint(from direction: VerticalDirection, axis: DefaultAxis<Double>) -> Double? {
            fatalError()
        }
    }
    
    struct PModel: PlotModel {
        typealias Point = PPoint
        typealias Entity = Double
        typealias VerticalCoordinate = Double
        typealias HorizontalCoordinate = Double
        typealias Position = Double
        let verticalAxis: DefaultAxis<Double>
        let horizontalAxis: DefaultAxis<Double>
        let points: [Double: [PPoint]]
    }
    
    struct PViewConfiguration { }
    
    struct PView: PlotView {
        
        /// `StyledPath.Composite`-representation of `Renderable`-conforming type.
        var rendered: StyledPath.Composite {
            fatalError()
        }

        let renderables: [Renderable]
        let model: PModel
        let configuration: PViewConfiguration
        let concreteHorizontalPosition: (Double) -> Double = { x in x }
        let concreteVerticalPosition: (Double) -> Double = { y in y }
    }
}
