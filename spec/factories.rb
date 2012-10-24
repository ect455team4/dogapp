# Factory Girl simulates the User Model

Factory.define :user do |user|
	user.first_name						"User"
	user.last_name						"Example"
	user.email							"User@Example.org"
	user.dob							"08/08/1990"
	user.address						"1234 Road Dr"
	user.city							"Chicago"
	user.state							"IL"
	user.country						"United States"
	user.short_bio						"This is the short bio section."
	user.long_bio						"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."
	user.password 						"password"
	user.password_confirmation			"password"
end