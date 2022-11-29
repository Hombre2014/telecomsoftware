# Telecommunication software GmbH programming challenge

>  Programming challenge for a software developer position.

## Description

Programming Evaluation
This exercise consists of 3 consecutive steps.
You don’t have to master all steps – solve the exercise as far as you can.
samwin naturally stores names including umlauts. Older devices are sometimes not capable of handling umlauts and send names with umlauts replaced (Ä .. AE, Ö .. OE, Ü .. UE, ß .. SS).
To find these names in the database, the replacement letters have to be converted to their umlaut counterparts.
Names are stored in capital letters.
Step 1
Develop a program which converts the replacement letters into their umlaut counterparts.
You can define whether ISO-8859-1 or UTF-8 encoding is to be used.
Examples:
KOESTNER -> KÖSTNER
RUESSWURM -> RÜßWURM
Step 2
Since names might exist that contain the replacement letters, a list of possible variations has to be generated for any given name.
Develop a program which generates a list of all possible variations of a given name.
Examples:
KOESTNER -> (KOESTNER, KÖSTNER)
RUESSWURM -> (RUESSWURM, RÜßWURM, RUEßWURM, RÜSSWURM)
Step 3
A SQL statement used to search for a name might look like this:
SELECT * FROM tbl_phonebook WHERE last_name = 'RUESSWURM'
Extend your program from step 2 to generate a SQL statement to search for all variations of a given name.
Please send us your source code as well as the output for each step using the following names:
KOESTNER
RUESSWURM
DUERMUELLER
JAEAESKELAEINEN
GROSSSCHAEDL

## Live demo

No demo yet.

## Deployment

N/A

## Built With

- Languages: Ruby
- Framework: Ruby on Rails 7.0.4
- Database: PostgreSQL

## Usage

Run the following commands:</br>
`git clone https://github.com/Hombre2014/telecomsoftware.git`</br>
`cd telecomsoftware`</br>
`bundle install`</br>
`rails s`</br>
Open a browser and go to: `https://localhost:3000` to view the app.

## Database setup

To start with clean database use:

`cd telecomsoftware`</br>
`rails db:drop db:create db:migrate`

## Testing

`cd telecomsoftware`</br>
N/A

## Author

👤 **Yuriy Chamkoriyski**

- GitHub: [@Hombre2014](https://github.com/Hombre2014)
- Twitter: [@Chamkoriyski](https://twitter.com/Chamkoriyski)
- LinkedIn: [axebit](https://linkedin.com/in/axebit)

## 🤝 Contributing

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](https://github.com/Hombre2014/telecomsoftware/issues).

## Show your support

Give a ⭐️ if you like this project!

## 📝 License

This project is [MIT](./license.md) licensed.
