# README

## Quick instructions to set up the project:
1. `bundle install`
2. `bun install` (I wanted to try current built-in support for Bun in Rails - sorry :D It is still not good btw)
If you don't have Bun on your machine, [follow instructions here](https://bun.sh/docs/installation#installing)

3. Run `rails db:create db:migrate && rails db:seed`

## To run the project locally:
 - Option 1: `bin/dev` to run all processes at once
 - Option 2:
    - Step 1: Run `bun run build && bun run build:css`
    - Step 2: Run rails server with `rails s` command
    - Step 3: Open [localhost:3000](http://localhost:3000), where the project is now ready