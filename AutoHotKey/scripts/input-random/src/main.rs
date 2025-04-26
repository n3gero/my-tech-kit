use passwords::PasswordGenerator;
use enigo::{
  Enigo, Keyboard, Settings,
};

fn main() {
  let pg = PasswordGenerator {
    length: 16,
    numbers: true,
    lowercase_letters: true,
    uppercase_letters: true,
    symbols: true,
    spaces: false,
    exclude_similar_characters: true,
    strict: false,
  };

  let password = pg.generate_one().unwrap();

  let settings = Settings::default();
  let mut enigo = Enigo::new(&settings).unwrap();
  enigo.text(&password).unwrap();
}
