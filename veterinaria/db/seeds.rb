# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
<<<<<<< HEAD
#   Mayor.create(name: 'Emanuel', city: cities.first)


   departments = Department.create([{ name: 'Amazonas' }, { name: 'Ancash' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

=======
#   Mayor.create(name: 'Emanuel', city: cities.id)

Department.create([{ name: 'Lima' }])

department = Department.find_by_name('Lima')

Province.create([{ :name => 'Lima', :department_id => department }])

province = Province.find_by_name('Lima')

District.create([{ name: 'Lima', province_id: province}])
District.create([{ name: 'Ancon', province_id: province}])
District.create([{ name: 'Ate', province_id: province}])
District.create([{ name: 'Breña', province_id: province}])
District.create([{ name: 'Carabayllo', province_id: province}])
District.create([{ name: 'Comas', province_id: province}])
District.create([{ name: 'Chaclacayo', province_id: province}])
District.create([{ name: 'Chorrillos', province_id: province}])
District.create([{ name: 'La Victoria', province_id: province}])
District.create([{ name: 'La Molina', province_id: province}])
District.create([{ name: 'Lince', province_id: province}])
District.create([{ name: 'Lurigancho', province_id: province}])
District.create([{ name: 'Lurin', province_id: province}])
District.create([{ name: 'Magdalena del mar', province_id: province}])
District.create([{ name: 'Miraflores', province_id: province}])
District.create([{ name: 'Pachacamac', province_id: province}])
District.create([{ name: 'Pueblo Libre', province_id: province}])
District.create([{ name: 'Pucusana', province_id: province}])
District.create([{ name: 'Puente Piedra', province_id: province}])
District.create([{ name: 'Punta Hermosa', province_id: province}])
District.create([{ name: 'Punta Negra', province_id: province}])
District.create([{ name: 'Rimac', province_id: province}])
District.create([{ name: 'San Bartolo', province_id: province}])
District.create([{ name: 'San Isidro', province_id: province}])
District.create([{ name: 'Barranco', province_id: province}])
District.create([{ name: 'San Martin de Porres', province_id: province}])
District.create([{ name: 'San Miguel', province_id: province}])
District.create([{ name: 'Santa Maria del Mar', province_id: province}])
District.create([{ name: 'Santa Rosa', province_id: province}])
District.create([{ name: 'Santiago de Surco', province_id: province}])
District.create([{ name: 'Surquillo', province_id: province}])
District.create([{ name: 'Villa Maria del Triunfo', province_id: province}])
District.create([{ name: 'Jesus Maria', province_id: province}])
District.create([{ name: 'Independencia', province_id: province}])
District.create([{ name: 'El Agustino', province_id: province}])
District.create([{ name: 'San Juan de Miraflores', province_id: province}])
District.create([{ name: 'San Juan de Lurigancho', province_id: province}])
District.create([{ name: 'San Luis', province_id: province}])
District.create([{ name: 'Cieneguilla', province_id: province}])
District.create([{ name: 'San Borja', province_id: province}])
District.create([{ name: 'Villa el Salvador', province_id: province}])
District.create([{ name: 'Los Olivos', province_id: province}])
District.create([{ name: 'Santa Anita', province_id: province}])
>>>>>>> b2a9348a1a086f1b9134d8d4607600bf25c58948
