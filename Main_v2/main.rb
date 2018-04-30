# Project by Jesper Kirial and Niklas Buhl

# Too add to Sketchup on Niklas

  # UI.menu.add_item("Reload My File") { load("/Users/nbxyz/Develop/Sketchup-Gcode-5-Axis-Laser-Cutter/Main_v2/main.rb");}


require 'sketchup'
# require 'os' # https://rubygems.org/gems/os

require_relative 'modelfaces'
require_relative 'analysefaces'

module Main

  # Hello World

  puts "Hello World. v0.3 - UpdateExtension working on mac"

  # Includes

  include ModelFaces
  include AnalyseFaces

  # Variables

  $faceArray = Array.new # Keep track of found faces

  # ---

  # Primary Methods

  # ---

  def self.AnalyseModel

    puts "Analysing model..."

    puts "Finding faces..."

    foundFacesCount = 0

    # Analyse model for faces

    ModelFaces.FaceCheck Sketchup.active_model.entities, foundFacesCount, $faceArray

    # Color found faces green

    ModelFaces.FoundFaces $faceArray

    puts "Faces found!"

    puts "Analysing found faces..."

    $faceArray.each do |face|

      # Check for top and bottom
      next if AnalyseFaces.TopBottom face

      # Check for faces with too many vertices
      next if AnalyseFaces.TooManyVertices face

      # Check if faces is too angled

      #

    end

    puts "Analysed found faces!"

    puts "Model Analysed!"

  end

  def self.AnalyseCuttingFaces

    puts "Analysing cutting faces..."

    # Analyse each face

    puts "Cutting faces analysed!"

  end

  def self.CalculateCuttingStrategy

    puts "Calculating cutting strategy..."

    # Optimize each cutting faces

    # Optimize cutting and moving path

    puts "Cutting strategy calculated!"

  end

  def self.GenerateGCode

    puts "Generating GCode..."

  end

  def self.ExportGCode

    puts "Export GCode..."

  end

  # ---

  # Developer Utilities

  # ---

  def self.GenerateTestModels

  end

  def self.UpdateExtension

    puts "Updating modules. v0.5 - OS Detection"

    projectdir = File.dirname(__FILE__)

    load projectdir + "/modelfaces.rb"
    load projectdir + "/analysefaces.rb"

    # puts projectdir

=begin

    if OS.osx?
      load projectdir + "/modelfaces.rb"
      load projectdir + "/analysefaces.rb"
    end

=end

  end

  # ---

  # User Interface Dropdown Menu

  # ---

  unless file_loaded?(__FILE__)

    menu = UI.menu('Plugins')

    menu.add_item('Analyse Model') {self.AnalyseModel}
    menu.add_item('Analyse Cutting Faces') {self.AnalyseCuttingFaces}
    menu.add_item('Calculate Cutting Strategy') {self.CalculateCuttingStrategy}
    menu.add_item('Generate GCode') {self.GenerateGCode}
    menu.add_item('Export GCode') {self.ExportGCode}

    # Remove everything and generate test models (Used for development purposes)
    menu.add_item('Generate Test Models') {self.GenerateTestModels}

    # To remove extension (Used for development purposes)
    menu.add_item('Update Extension') {self.UpdateExtension}

    file_loaded(__FILE__)

  end

  # ---

  # User Interface Toolbar

  # ---

  # Create new toolbar with buttons.

=begin
  toolbar = UI::Toolbar.new "5 Axis Lasercutter"

  cmd = UI::Command.new("Analyse Model") { AnalyseModel }
  toolbar.add_item cmd

  toolbar = toolbar.add_separator
  cmd = UI::Command.new("Analyse Cutting Faces") { AnalyseCuttingFaces }
  toolbar.add_item cmd

  toolbar = toolbar.add_separator
  cmd = UI::Command.new("Calculate Cutting Strategy") { CalculateCuttingStrategy }
  toolbar.add_item cmd

  toolbar = toolbar.add_separator
  cmd = UI::Command.new("Generate GCode") { GenerateGCode }
  toolbar.add_item cmd

  toolbar = toolbar.add_separator
  cmd = UI::Command.new("Export GCode") { ExportGCode }
  toolbar.add_item cmd

  toolbar = toolbar.add_separator
  cmd = UI::Command.new("Generate Test Models") { GenerateTestModels }
  toolbar.add_item cmd

  toolbar = toolbar.add_separator
  cmd = UI::Command.new("Update Extension") { UpdateExtension }
  toolbar.add_item cmd

  toolbar.show

  toolbar.each { | item |
    puts item
  }
=end

end