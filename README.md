### Extract

This is a CLI app built with Ruby, it extracts EXIF gps data from images.

Gems that have been used are

  * **exif**
    - This gem is responsible for extracting the EXIF information from the images.

  * **RSpec**
    - Used for testing the features

  * **Cucumber**
    - Used for testing behavior

The in-built modules used are
  * **CSV**
    - For printing all the EXIF data extracted to a csv file

  * **OptionParser**
    - For creating different options for different operations in the app.

To run the app, first run the following commands,
  ```
   cd extract
  ```
  and then run
  ```
  bundle
  ```

Then, install `libexif`, use either of the following commands to install it(depends on the OS you are using.)
  ```
  $ brew install libexif             # Homebrew
  $ sudo apt-get install libexif-dev # APT
  $ sudo yum install libexif-devel   # CentOS
  ```

You are all set now! Now, cd into lib on the terminal
```
cd lib
```
To get the GPS info for images in one directory, run
```
ruby app.rb
```

To get the GPS info for all the images in all the directories, run
```
ruby app.rb -a
```

To get the GPS info for all the images in all the directories printed to a CSV file, run
```
ruby app.rb -pr
```

And if you feel lost (I hope you don't get lost!) , run
```
ruby app.rb -h
```
