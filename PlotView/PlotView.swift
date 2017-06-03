//
//  PlotView.swift
//  PlotView
//
//  Created by James Bean on 1/14/17.
//
//

import PlotModel
import GraphicsTools

public protocol PlotRenderer: Renderer {
    
    associatedtype InformationRenderer
    associatedtype StructureRenderer
    
    var informationRenderer: InformationRenderer { get }
    var structureRenderer: StructureRenderer { get }
}

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
/// The graphical information is stratified into two layers: `structure` and `information`.
/// The `structure` layer may contain graphical elements like lines and axes. The `information`
/// layer will contain graphical representations of the actualy musical information.
///
/// Each of the graphical layers has its own renderer which can be define explicitly for any
/// type of musical information.
public protocol PlotView: Renderer {
    
    // MARK: - Associated Types
    
    // MARK: Model
    
    /// The information that will be rendered onto a `PlotView`.
    associatedtype Model: PlotModel
    
    // MARK: Abstract positioning of entities
    
    /// Type that describes the abstract vertical coordinate system of a `PlotView`.
    ///
    /// For example, `Staff` implements this as `StaffSlot`.
    associatedtype VerticalCoordinate
    
    /// Type that describes the abstract horizontal coordinate system of a `PlotView`.
    associatedtype HorizontalCoordinate
    
    // MARK: Concrete positioning of entities
    
    /// Native numerical type of `GraphicalContext`. Probably a floating-point type.
    associatedtype Position
    
    // MARK: Graphics
    
    /// Renderer tailor made for this `PlotView`-conforming type.
    associatedtype Renderer: PlotRenderer
    
    /// The type of graphical context onto which this `PlotView` will be rendered.
    associatedtype GraphicalContext
    
    // MARK: - Instance Properties
    
    // MARK: Model
    
    /// The information that will be rendered onto a `PlotView`.
    var model: Model { get }
    
    // MARK: Positioning of entities
    
    /// Transforms an abstract vertical coordinate into a concrete vertical position.
    var concreteVerticalPosition: (VerticalCoordinate) -> Position { get }
    
    /// Transforms an abstract horizontal coordinate into a concrete horizontal position.
    var concreteHorizontalPosition: (HorizontalCoordinate) -> Position { get }
}
