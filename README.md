# Jungle - A lesson in extending an existing codebase

## Table Of Contents

- [Why is Jungle?](#why-is-jungle)
- [What I did](#what-i-did)
  - [Detailed List](#detailed-list)
- [What is Jungle?](#orignal-jungle-summary)
- [Images](#images)
  - [Home Page](#home-page)
  - [Product Categories](#categories)
  - [Product Details](#product-details)
  - [Cart: Empty](#empty-cart)
  - [Cart: Full](#full-cart)
  - [Order Placed](#order-placed)
  - [Order Email: HTML](#email-preview-html)
  - [Order Email: Text](#email-preview-text-fallback)
  - [Admin Dashboard](#admin-dashboard)
  - [Admin Products Panel](#admin-product-management)
    - [Add Product](#admin-add-product)
  - [Admin Discount Management](#admin-discount-management)
- [Setup](#setup)
- [Dependencies](#dependencies)

## Why is Jungle?

Jungle is a week long lesson on how to work on older existing codebases.\
Over the course of a week, We had to fix bugs and implement brand new features!

## What I did

I was given vague descriptions of bugs to fix, features to add, and guidence on how to create comprehensive tests.

### Detailed list:

- Fix: No auth for admin panel
- Fix: Money not being consistently formatted
- Fix: Inventory not updating when order is placed
- UI: [Change cart page when it had no items](#empty-cart)
- UI: [Updated Order Summary to summerize order](#order-placed)
- Feature: [Sold out badge on items](#home-page)
- Feature: [Admin dashboard with store overview](#admin-dashboard)
- Feature: Admin page to manage categories
- Feature: [Admin page to manage discounts](#admin-discount-management)
- Feature: [Email Order to User on Completion](#email-preview-html)
  - [Text Fallback](#email-preview-text-fallback)
- Feature: User Accounts
- Testing: Added Rspec testing for models, controllers and web pages

### Orignal Jungle Summary

A mini e-commerce application built with Rails 4.2 for purposes of teaching Rails by example.

# Images

---

### Home Page

> ![home page](/ReadMe_assets/imgs/home_page.png)

---

### Categories

> ![home categories](/ReadMe_assets/imgs/admin_home_categories.png)

---

### Product Details

> ![home product details](/ReadMe_assets/imgs/home_product_details.png)

---

### Empty Cart

> ![cart empty](/ReadMe_assets/imgs/cart_empty.png)

---

### Full Cart

> ![cart full](/ReadMe_assets/imgs/cart_full.png)

---

### Order Placed

> ![order fulfilled](/ReadMe_assets/imgs/order_fulfilled.png)

---

### Email Preview (HTML)

> ![email html](/ReadMe_assets/imgs/email_order_html.png)

---

### Email Preview (Text Fallback)

> ![email text](/ReadMe_assets/imgs/email_order_text.png)

---

### Admin Dashboard

> ![admin dashboard](/ReadMe_assets/imgs/admin_dashboard.png)

---

### Admin Product Management

> ![admin products](/ReadMe_assets/imgs/admin_products.png)

---

### Admin Add Product

> ![admin products add](/ReadMe_assets/imgs/admin_products_add.png)

---

### Admin Discount Management

> ![admin sales](/ReadMe_assets/imgs/admin_sales.png)

---

# Setup

## Additional Steps for Apple M1 Machines

1. Make sure that you are runnning Ruby 2.6.6 (`ruby -v`)
1. Install ImageMagick `brew install imagemagick imagemagick@6 --build-from-source`
1. Remove Gemfile.lock
1. Replace Gemfile with version provided [here](https://gist.githubusercontent.com/FrancisBourgouin/831795ae12c4704687a0c2496d91a727/raw/ce8e2104f725f43e56650d404169c7b11c33a5c5/Gemfile)

## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rake db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s` to start the server

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

- Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
- PostgreSQL 9.x
- Stripe
- [Full List](/Gemfile)
