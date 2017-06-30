//
//  VerticalPlotLinesCollection.swift
//  PlotView
//
//  Created by James Bean on 6/30/17.
//
//

import GeometryTools
import PathTools
import GraphicsTools

public struct VerticalPlotLinesCollection: Renderable {
    
    public struct Configuration {
        public let height: Double
        public let linesColor: Color
        public let lineWidth: Double
    }
    
    public var rendered: StyledPath.Composite {
        return .leaf(boundaryLines)
    }
    
    public let staffLines: LinesSegmentCollection
    public let configuration: Configuration
    
    public init(staffLines: LinesSegmentCollection, configuration: Configuration) {
        self.staffLines = staffLines
        self.configuration = configuration
    }
    
    private var boundaryLines: StyledPath {
        
        let path = Path(
            staffLines.flatMap { segment in
                return (0..<1).map { lineNumber in
                    let altitude = Double(lineNumber) * configuration.height
                    let left = segment.start
                    let right = segment.stop
                    return BezierCurve(
                        start: Point(x: left, y: altitude),
                        end: Point(x: right, y: altitude)
                    )
                }
            }
        )
        
        let styling = Styling(
            stroke: Stroke(width: configuration.lineWidth, color: configuration.linesColor)
        )
        
        return StyledPath(frame: .zero, path: path, styling: styling)
    }
}
