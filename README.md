<a name="readme-top"></a>

## 📗 Table of Contents

- [Recipe-rails 🍔 ](#recipe-rails--)
    - [Tech Stack ](#tech-stack-)
    - [Key Features ](#key-features-)
  - [💻 Getting Started ](#-getting-started-)
    - [Prerequisites ](#prerequisites-)
    - [Setup ](#setup-)
    - [Installation ](#installation-)
    - [database ](#database-)
    - [Usage ](#usage-)
    - [Run tests ](#run-tests-)
  - [✍️ Authors ](#️-authors-)
    - [👤 **Salwa Ballouti**:](#-salwa-ballouti)
    - [👤 **Billal Chami**:](#-billal-chami)
    - [👤 **Sabi Mantock**](#-sabi-mantock)
  - [🔭 Future Features ](#-future-features-)
  - [🤝 Contributing ](#-contributing-)
  - [💖 Show your support ](#-show-your-support-)
  - [🙏 Acknowledgments ](#-acknowledgments-)
  - [📝  License ](#--license-)


# Recipe-rails 🍔 <a name="about-project"></a>

>**Recipe-rails: is a rails application that allows users to create, share, and discover recipes using postgres database and RESTful design. Users can create their own profile, where they can add, edit, and delete their recipes. They can also consulte recipes, such as ingredients, cooking time, difficulty level, and more. The app can have features such as inventories, generated shopping list. Overall, a Recipe app in Rails can provide a platform for food enthusiasts to share their love of cooking and discover new recipes.**.<a name="built-with"></a>

### Tech Stack <a name="tech-stack"></a>

<details>
  <summary>Client</summary>
  <ul>
    <li><a href="https://www.ruby-lang.org/en/">Ruby</a></li>
    <li><a href="https://rubyonrails.org/">Rails</a></li>
    <li><a href="https://www.postgresql.org/">Postgres</a></li>
  </ul>
</details>

<details>
<summary>Testing</summary>
  <ul>
    <li><a href="https://rspec.info/">RSpec</a></li>
  </ul>
</details>

<details>
<summary>Linter</summary>
  <ul>
    <li><a href="https://rubocop.org/">Rubocop</a></li>
  </ul>
</details>

### Key Features <a name="key-features"></a>

- **Sign up or log in**
- **Create a new food**
- **Generate shopping list**

<p align="right">(<a href="#readme-top">back to top</a>)</p>


## 💻 Getting Started <a name="getting-started"></a>

To get a local copy up and running, follow these steps.

### Prerequisites <a name="prerequisites"></a>

In order to run this project you need [Ruby](https://www.ruby-lang.org/en/), [Rails] (https://rubyonrails.org/), and [postgres] (https://www.postgresql.org/) installed on your machine.


### Setup <a name="setup"></a>

Clone this repository to your desired folder:

```sh
  git clone https://github.com/bill7pearl/recipe-rails.git
```

```sh
  cd recipe-rails
```


### Installation <a name="installation"></a>

Install this project with:

```sh
  bundle install
```

### database <a name="usage"></a>

Create databases and run the migrations with:

```sh
  rails db:create
  rails db:migrate
```

### Usage <a name="usage"></a>

To run the project, execute the following command:

```sh
  rails server
```

### Run tests <a name="run-tests"></a>

To run tests, run the following command:

```sh
  rails db:create RAILS_ENV=test
```

```sh
  rails db:schema:load RAILS_ENV=test
```

```sh
  bundle exec rspec
```

<p align="right">(<a href="#readme-top">back to top</a>)</p>


## ✍️ Authors <a name="authors"></a>
  
### 👤 **Salwa Ballouti**:
- GitHub: [@Salwa99](https://github.com/Salwa99)
- Twitter: [@SalwaBallouti](https://twitter.com/salwa_ballouti)
- LinkedIn: [LinkedIn](https://www.linkedin.com/in/salwa-ballouti)

### 👤 **Billal Chami**:
- GitHub: [@githubhandle](https://github.com/bill7pearl)
- Twitter: [@twitterhandle](https://twitter.com/BillChami)
- LinkedIn: [LinkedIn](https://www.linkedin.com/in/billal-chami-263497194/)
- 

### 👤 **Sabi Mantock**

- GitHub: [@SabiMantock](https://github.com/SabiMantock)
- Twitter: [@IamSabiMantock](https://twitter.com/IamSabiMantock)
- LinkedIn: [Sabi Mantock](https://linkedin.com/in/sabi-mantock)

<p align="right">(<a href="#readme-top">back to top</a>)</p>


## 🔭 Future Features <a name="future-features"></a>

- [ ] **Add comments section**
- [ ] **Add rating stars**
- [ ] **Create API**

<p align="right">(<a href="#readme-top">back to top</a>)</p>


## 🤝 Contributing <a name="contributing"></a>

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](../../issues/)

<p align="right">(<a href="#readme-top">back to top</a>)</p>


## 💖 Show your support <a name="support"></a>

If you like this project, please consider giving it a 🌟.

<p align="right">(<a href="#readme-top">back to top</a>)</p>


## 🙏 Acknowledgments <a name="acknowledgements"></a>

We would like to thank microverse for serving this opprtunity.


<p align="right">(<a href="#readme-top">back to top</a>)</p>


## 📝  License <a name="license"></a>

This project is [MIT](./LICENSE) licensed.

<p align="right">(<a href="#readme-top">back to top</a>)</p>
