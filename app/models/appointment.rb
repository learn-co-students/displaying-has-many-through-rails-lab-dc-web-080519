class Appointment < ApplicationRecord
  belongs_to :doctor
  belongs_to :patient

  def scheduled
    # date = self.appointment_datetime.strftime('%B %d, %Y at %l:%M')
    date = self.appointment_datetime.strftime('%B %d, %Y at %k:%M')
    # time = self.appointment_datetime.strftime('%l:%M')
    # date + " at " + time
  end
end
