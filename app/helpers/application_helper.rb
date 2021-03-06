module ApplicationHelper

  def integer_to_time(int)
    hours = int / 60 / 60
    mins = int.modulo(60 * 60) / 60
    secs = int.modulo(60)

    format("%02d:%02d:%02d", hours, mins, secs)
  end

  def time_to_integer(time)
    t = Time.parse(time)
    t.hour * 3600 + t.min * 60 + t.sec
  end

  def formatted_time(time)
    time.strftime("%I:%M %p")
  end

  def formatted_date(date)
    date.strftime("%m/%d/%Y")
  end

  def link_to_add_fields(name, f, association)
    new_object = f.object.send(association).klass.new
    id = new_object.object_id
    fields = f.simple_fields_for(association, new_object, child_index: id.abs) do |builder|
      render(association.to_s.singularize + "_fields", f: builder)
    end
    link_to(name, '#', class: "add_fields", data: {id: id, fields: fields.gsub("\n", "")})
  end

end
