require 'distance/version'

class Distance
  # Multipliers from standard race units to meters
  module Multiplier
    KILOMETER = 1000.0
    MILE      = 1609.344
  end
  private_constant :Multiplier

  def initialize(distance_in_meters)
    @distance_in_meters = distance_in_meters.to_f
  end

  MARATHON      = new(42195.0)
  HALF_MARATHON = new(21097.5)

  def self.kilometers(n)
    new(n * Multiplier::KILOMETER)
  end

  def self.miles(n)
    new(n * Multiplier::MILE)
  end

  def to_f
    distance_in_meters
  end

  def to_miles
    (distance_in_meters / Multiplier::MILE).round(2)
  end

  def to_kilometers
    distance_in_meters / Multiplier::KILOMETER
  end

  def +(other)
    unless other.is_a?(Distance)
      raise ArgumentError, 'Can only add a Distance to a Distance'
    end
    Distance.new(to_f + other.to_f)
  end

  def -(other)
    unless other.is_a?(Distance)
      raise ArgumentError, 'Can only subtract a Distance from a Distance'
    end
    Distance.new(to_f - other.to_f)
  end

  def *(multiplier)
    unless multiplier.is_a?(Numeric)
      raise ArgumentError, 'Can only multiply a Distance with a number'
    end
    Distance.new(to_f * multiplier)
  end

  def /(divisor)
    unless divisor.is_a?(Numeric)
      raise ArgumentError, 'Can only divide a Distance by a number'
    end
    Distance.new(to_f / divisor)
  end

  def >(other)
    return false unless other.is_a?(Distance)
    to_f > other.to_f
  end

  def >=(other)
    return false unless other.is_a?(Distance)
    to_f >= other.to_f
  end

  def ==(other)
    return false unless other.is_a?(Distance)
    to_f == other.to_f
  end

  def <(other)
    return false unless other.is_a?(Distance)
    to_f < other.to_f
  end

  def <=(other)
    return false unless other.is_a?(Distance)
    to_f <= other.to_f
  end

  private

  attr_reader :distance_in_meters
end
