require 'rails_helper'


RSpec.describe HelperableConcern do
  include HelperableConcern

  describe 'should create a template' do
    base = %w[name last_name e-mail hours department]
    workers = [%w[Juan Lazo hj@gmail.com 10-18 Science],
               %w[Pedro Benza pnb@gmail.com 10-15 Maths],
               %w[Juan Orto otro@gmail.com 10-18 Science]]
    workers2 = [%w[Juan Lazo hj@gmail.com 10-18 Science],
                %w[Pedro Benza pnb@gmail.com 10-15 Maths],
                %w[Juan Orto otro@gmail.com 10-18 Science],
                ['Lolo', nil, 'otrofer@gmail.com', '10-18', 'Science']]


    it 'creates a template' do
      template = create_template(base)
      expect(template).not_to be_nil
      expect(template).to be_a(Hash)
      expect(template.length).to eql base.length
      expect(template['name']).to be_truthy
      expect(template['last_name']).to be_truthy
      expect(template['e-mail']).to be_truthy
      expect(template['hours']).to be_truthy
      expect(template['department']).to be_truthy
    end

    it 'creates a loop to save workers' do
      template = create_template(base)
      workers_to_save = create_workers(workers, template)
      p workers_to_save
    end

    it 'creates a loop to save workers' do
      template = create_template(base)
      workers_to_save = create_workers(workers2, template)
      p workers_to_save
    end

  end
end
