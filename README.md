# Dojo Web Starter: Official Guide

The official Dojo Starter guide, the quickest and most streamlined way to get your Dojo Autonomous World up and running. This guide will assist you with the initial setup, from cloning the repository to deploying your world.

The Dojo Starter contains the minimum required code to bootstrap your Dojo Autonomous World. This starter package is included in the `dojoup` binary. For more detailed instructions, please refer to the official Dojo Book [here](https://book.dojoengine.org/getting-started/installation.html).

## Prerequisites

- Rust - install [here](https://www.rust-lang.org/tools/install)
- Cairo language server - install [here](https://book.dojoengine.org/development/setup.html#3-setup-cairo-vscode-extension)

## Step-by-Step Guide

Follow the steps below to setup and run your first Autonomous World.

### Step 1: Install `dojoup`

Start by installing `dojoup`. This cli tool is a critical component when building with Dojo. It manages dependencies and helps in building your project. Run the following command in your terminal:

```console
curl -L https://install.dojoengine.org | bash
dojoup
```

The command downloads the `dojoup` installation script and executes it.

### Step 2: Clone the Repository

The next step is to clone the repository to your local machine. Open your terminal and type the following command:

```console
git clone https://github.com/coostendorp/dojo-web-starter && cd dojo-web-starter
```

This command will create a local copy of the Dojo Web Starter repository and enter the project directory.

### Step 3: Build the Example World

With `dojoup` installed, you can now build your example world using the following command:

```console
make build
```

This command compiles your project and prepares it for execution.

### Step 4: Start Katana RPC

[Katana RPC](https://book.dojoengine.org/framework/katana/overview.html) is the communication layer for your Dojo World. It allows different components of your world to communicate with each other. To start Katana RPC, use the following command:

```console
katana --allow-zero-max-fee
```

### Step 5: Migrate (Deploy) the World

Finally, deploy your world using the `sozo migrate` command. This command, deploys your world to Katana!

```console
make deploy
```

### Step 6: Get the React frontend ready

```console
make prep_web
cd web
yarn
```

### Step 7: Run the frontend locally

```console
cd web
yarn dev
```
