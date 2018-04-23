require 'sketchup.rb'

# Project by Jesper Kirial and Niklas Buhl

# Learning
require_relative 'first.rb'

# Import GCode Functions
require_relative 'importgcode.rb'

# Analyse Model Functions
require_relative 'analysemodel.rb'

# Cutting Strategy Functions
require_relative 'cuttingstrategy.rb'

# Trajectory Planning Functions
require_relative 'trajectoryplanning.rb'

# Export GCode Functions
require_relative 'exportgcode.rb'

#GCode Class (Struct, "Draw")
require_relative 'gcodeclass.rb'

#Assets: Position, Orientation
require_relative 'assets.rb'

module Main

  puts "Loading all systems..."

  #include First
  include ImportGCode
  include AnalyseModel
  include CuttingStrategy
  include TrajectoryPlanning
  include ExportGCode
  include First

  puts "All systems go! Stupid loading..."

  # Creating the empty array
  puts "Creating empty GCode array."

  $gcodearray = Array.new

  # Global origin position
  $origin = Geom::Point3d.new(0,0,0);

  # Position used for drawing GCode instructions
  $position = Geom::Point3d.new(0,0,0);


  def self.hello_world

    puts "Hello, World!"

  end

  # def self.hello_first
  #
  #   First.first_method
  #
  # end

  def self.example_model

    # Create a really nice example model!

    puts "Creating random examples model..."

  end

  # def self.test_array_function array
  #
  #   puts array
  #
  # end

  def self.import_gcode

    #test_array_function($gcodearray)

    ImportGCode.import_gcode($gcodearray)

    # Testing content of array inside and outside above function.
    #$gcodearray.each { |gcode| gcode.print}

  end

  def self.analyse_model

    AnalyseModel.find_vertices
    AnalyseModel.find_planes
    AnalyseModel.analyse_planes

  end

  def self.cutting_strategy

    CuttingStrategy.select_strategy
    CuttingStrategy.cutting_path_strategy_a
    CuttingStrategy.cutting_path_strategy_b
    CuttingStrategy.cutting_path_strategy_c

  end

  def self.trajectory_planning

    TrajectoryPlanning.generate_travel_points
    TrajectoryPlanning.optimize
    TrajectoryPlanning.complete


  end

  def self.draw_gcode

    ExportGCode.draw($gcodearray, $position)

  end

  def self.export_gcode

    ExportGCode.generate_gcode
    ExportGCode.create_new_file
    ExportGCode.write_gcode_to_file

  end

  def self.update_extension

    puts "Updating modules"

    load("/Users/nbxyz/Develop/Sketchup-Gcode-5-Axis-Laser-Cutter/Main_v1/importgcode.rb")
    load("/Users/nbxyz/Develop/Sketchup-Gcode-5-Axis-Laser-Cutter/Main_v1/cuttingstrategy.rb")
    load("/Users/nbxyz/Develop/Sketchup-Gcode-5-Axis-Laser-Cutter/Main_v1/analysemodel.rb")
    load("/Users/nbxyz/Develop/Sketchup-Gcode-5-Axis-Laser-Cutter/Main_v1/exportgcode.rb")
    load("/Users/nbxyz/Develop/Sketchup-Gcode-5-Axis-Laser-Cutter/Main_v1/trajectoryplanning.rb")
    load("/Users/nbxyz/Develop/Sketchup-Gcode-5-Axis-Laser-Cutter/Main_v1/gcodeclass.rb")
    load("/Users/nbxyz/Develop/Sketchup-Gcode-5-Axis-Laser-Cutter/Main_v1/assets.rb")


  end

  unless file_loaded?(__FILE__)

    menu = UI.menu('Plugins')

    menu.add_item('Hello World') {self.hello_world}
    # Learning about functions in other files
    # menu.add_item('Hello First World') {self.hello_first}

    menu.add_item('Import GCode') {self.import_gcode}
    menu.add_item('Draw GCode') {self.draw_gcode}
    menu.add_item('Example Model') {self.example_model}
    menu.add_item('Analyse Model') {self.analyse}
    menu.add_item('Generate Cutting Paths') {self.cutting_strategy}
    menu.add_item('Trajectory Planning') {self.trajectory_planning}
    menu.add_item('Export GCode') {self.export_gcode}

    # To remove extension (Used for development purposes)
    menu.add_item('Update Extension') {self.update_extension}

    file_loaded(__FILE__)

  end

end
