class AddDateOfBirths < ActiveRecord::Migration[7.0]
  def change
    add_column :actors, :date_of_birth, :date

    # Заполняем новую колонку значениями, полученными из колонки age
    Actor.reset_column_information
    Actor.find_each do |record|
      # Пример преобразования числового значения в дату (замените на вашу логику)
      date_of_birth = Date.today - record.age.years

      record.update_column(:date_of_birth, date_of_birth)
    end

    # Удаляем старую колонку age
    remove_column :actors, :age



    add_column :directors, :date_of_birth, :date

    # Заполняем новую колонку значениями, полученными из колонки age
    Director.reset_column_information
    Director.find_each do |record|
      # Пример преобразования числового значения в дату (замените на вашу логику)
      date_of_birth = Date.today - record.age.years

      record.update_column(:date_of_birth, date_of_birth)
    end

    # Удаляем старую колонку age
    remove_column :directors, :age
  end
end
