require 'profiler'

@n = 10000
@c = ConferenceDate.first
@m = @c.meetings.build
@m.start_time = Time.parse("8am").time_of_day!
@m.end_time = Time.parse("8:15am").time_of_day!
@intime = Time.parse("8:10am").time_of_day!
@outtime = Time.parse("8:10pm").time_of_day!

Profiler__::start_profile

puts "Profiling cover..."

@n.times {
  (@m.start_time..@m.end_time).cover?(@intime)
  (@m.start_time..@m.end_time).cover?(@outtime)
}

Profiler__::stop_profile
Profiler__::print_profile($stderr)

Profiler__::start_profile

puts "Profiling LE GE..."

@n.times {
  (@m.start_time <= @time && @m.end_time >= @intime)
  (@m.start_time <= @time && @m.end_time >= @outtime)
}

Profiler__::stop_profile
Profiler__::print_profile($stderr)
