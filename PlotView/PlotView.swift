//
//  PlotView.swift
//  PlotView
//
//  Created by James Bean on 1/14/17.
//
//

import PlotModel
import GraphicsTools

/// Graphical representation of information.
///
/// The horizontal and vertical positioning of information if stratified into two steps:
/// - `(Vertical | Horizontal) Coordinate` systems:
/// Abstract model of a coordinate system
/// that may be implemented in any number of ways. For example, a `Staff` may model the
/// abstract position of `SpelledPitch` values on a given staff-line or in a given staff-space.
/// A string tablature system may have pre-defined positions which are irregularly placed.
///
/// - `Position`:
/// Concrete value for positioning a given musical element within a `PlotView`.
///
/// Each of the graphical layers has its own renderer which can be define explicitly for any
/// type of musical information.
public protocol PlotView: Renderer {
    
    // MARK: - Associated Types
    
    // MARK: Model
    
    /// The information that will be rendered onto a `PlotView`.
    ///
    /// - TODO: Swift 4: 
    ///     associatedtype Model: PlotModel where
    ///         PlotModel.VerticalAxis.Coordinate == VerticalCoordinate,
    ///         PlotModel.HorizontalAxis.Coordinate == HorizontalCoordinate
    ///
    associatedtype Model: PlotModel
    
    // MARK: Abstract positioning of entities
    
    /// Type that describes the abstract vertical coordinate system of a `PlotView`.
    ///
    /// For example, `Staff` implements this as `StaffSlot`.
    ///
    /// - TODO: In Swift 4, add recursive constraint: Model.VerticalAxis.Coordinate
    ///
    associatedtype VerticalCoordinate
    
    /// Type that describes the abstract horizontal coordinate system of a `PlotView`.
    ///
    /// - TODO: In Swift 4, add recursive constraint: Model.HorizontalAxis.Coordinate
    ///
    associatedtype HorizontalCoordinate
    
    // MARK: Graphics
    
    /// The type of graphical context onto which this `PlotView` will be rendered.
    associatedtype GraphicalContext
    
    // MARK: - Instance Properties
    
    // MARK: Model
    
    /// The information that will be rendered onto a `PlotView`.
    var model: Model { get }
    
    // MARK: Positioning of entities
    
    /// Transforms an abstract vertical coordinate into a concrete vertical position.
    var concreteVerticalPosition: (VerticalCoordinate) -> Double { get }
    
    /// Transforms an abstract horizontal coordinate into a concrete horizontal position.
    var concreteHorizontalPosition: (HorizontalCoordinate) -> Double { get }
    
    /// Render contents in the given `context` with the given `configuration`.
    func render(in context: GraphicalContext, with configuration: Configuration)
}
