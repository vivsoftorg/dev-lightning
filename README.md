
Welcome to dev-lightning, the open source version of Bolt.new, which allows you to choose the LLM that you use for each prompt! Currently, you can use OpenAI, Anthropic, Ollama, OpenRouter, Gemini, LMStudio, Mistral, xAI, HuggingFace, DeepSeek, Groq, Cohere, Together, Perplexity, Moonshot (Kimi), Hyperbolic, GitHub Models, Amazon Bedrock, and OpenAI-like providers - and it is easily extended to use any other model supported by the Vercel AI SDK! See the instructions below for running this locally and extending it to include more models.


## Manual installation


### Option 1: Node.js

Node.js is required to run the application.

1. Visit the [Node.js Download Page](https://nodejs.org/en/download/)
2. Download the "LTS" (Long Term Support) version for your operating system
3. Run the installer, accepting the default settings
4. Verify Node.js is properly installed:
   - **For Windows Users**:
     1. Press `Windows + R`
     2. Type "sysdm.cpl" and press Enter
     3. Go to "Advanced" tab → "Environment Variables"
     4. Check if `Node.js` appears in the "Path" variable
   - **For Mac/Linux Users**:
     1. Open Terminal
     2. Type this command:
        ```bash
        echo $PATH
        ```
     3. Look for `/usr/local/bin` in the output

## Running the Application

You have two options for running dev-lightning: directly on your machine or using Docker.

### Option 1: Direct Installation (Recommended for Beginners)

1. **Install Package Manager (pnpm)**:

   ```bash
   npm install -g pnpm
   ```

2. **Install Project Dependencies**:

   ```bash
   pnpm install
   ```

3. **Start the Application**:

   ```bash
   pnpm run dev
   ```


To run the application with a custom base path (for example, `/bolt`), use:

```bash
VITE_BASE_PATH=/bolt pnpm run dev
```

Replace `/bolt` with your desired base path if needed. This sets the frontend route base path.

### Option 2: Using Docker

This option requires some familiarity with Docker but provides a more isolated environment.

#### Additional Prerequisite

- Install Docker: [Download Docker](https://www.docker.com/)

#### Steps:

1. **Build the Docker Image**:

   ```bash
   # Using npm script:
   npm run dockerbuild

   # OR using direct Docker command:
   docker build . --target bolt-ai-development
   ```

2. **Run the Container**:
   ```bash
   docker compose --profile development up
   ```

### Option 3: Desktop Application (Electron)

For users who prefer a native desktop experience, dev-lightning is also available as an Electron desktop application:

1. **Download the Desktop App**:
   - Visit the [latest release](https://github.com/stackblitz-labs/dev-lightning/releases/latest)
   - Download the appropriate binary for your operating system
   - For macOS: Extract and run the `.dmg` file
   - For Windows: Run the `.exe` installer
   - For Linux: Extract and run the AppImage or install the `.deb` package

2. **Alternative**: Build from Source:
   ```bash
   # Install dependencies
   pnpm install

   # Build the Electron app
   pnpm electron:build:dist  # For all platforms
   # OR platform-specific:
   pnpm electron:build:mac   # macOS
   pnpm electron:build:win   # Windows
   pnpm electron:build:linux # Linux
   ```

The desktop app provides the same full functionality as the web version with additional native features.

## Configuring API Keys and Providers

dev-lightning features a modern, intuitive settings interface for managing AI providers and API keys. The settings are organized into dedicated panels for easy navigation and configuration.

### Accessing Provider Settings

1. **Open Settings**: Click the settings icon (⚙️) in the sidebar to access the settings panel
2. **Navigate to Providers**: Select the "Providers" tab from the settings menu
3. **Choose Provider Type**: Switch between "Cloud Providers" and "Local Providers" tabs

### Cloud Providers Configuration

The Cloud Providers tab displays all cloud-based AI services in an organized card layout:

#### Adding API Keys
1. **Select Provider**: Browse the grid of available cloud providers (OpenAI, Anthropic, Google, etc.)
2. **Toggle Provider**: Use the switch to enable/disable each provider
3. **Set API Key**:
   - Click the provider card to expand its configuration
   - Click on the "API Key" field to enter edit mode
   - Paste your API key and press Enter to save
   - The interface shows real-time validation with green checkmarks for valid keys

#### Advanced Features
- **Bulk Toggle**: Use "Enable All Cloud" to toggle all cloud providers at once
- **Visual Status**: Green checkmarks indicate properly configured providers
- **Provider Icons**: Each provider has a distinctive icon for easy identification
- **Descriptions**: Helpful descriptions explain each provider's capabilities

### Local Providers Configuration

The Local Providers tab manages local AI installations and custom endpoints:

#### Ollama Configuration
1. **Enable Ollama**: Toggle the Ollama provider switch
2. **Configure Endpoint**: Set the API endpoint (defaults to `http://127.0.0.1:11434`)
3. **Model Management**:
   - View all installed models with size and parameter information
   - Update models to latest versions with one click
   - Delete unused models
   - Install new models by entering model names

#### Other Local Providers
- **LM Studio**: Configure custom base URLs for LM Studio endpoints
- **OpenAI-like**: Connect to any OpenAI-compatible API endpoint
- **Auto-detection**: The system automatically detects environment variables for base URLs

### Environment Variables vs UI Configuration

dev-lightning supports both methods for maximum flexibility:

#### Environment Variables (Recommended for Production)
Set API keys and base URLs in your `.env.local` file:
```bash
# API Keys
OPENAI_API_KEY=your_openai_key_here
ANTHROPIC_API_KEY=your_anthropic_key_here

# Custom Base URLs
OLLAMA_BASE_URL=http://127.0.0.1:11434
LMSTUDIO_BASE_URL=http://127.0.0.1:1234
```

#### UI-Based Configuration
- **Real-time Updates**: Changes take effect immediately
- **Secure Storage**: API keys are stored securely in browser cookies
- **Visual Feedback**: Clear indicators show configuration status
- **Easy Management**: Edit, view, and manage keys through the interface

### Provider-Specific Features

#### OpenRouter
- **Free Models Filter**: Toggle to show only free models when browsing
- **Pricing Information**: View input/output costs for each model
- **Model Search**: Fuzzy search through all available models

#### Ollama
- **Model Installer**: Built-in interface to install new models
- **Progress Tracking**: Real-time download progress for model updates
- **Model Details**: View model size, parameters, and quantization levels
- **Auto-refresh**: Automatically detects newly installed models

#### Search & Navigation
- **Fuzzy Search**: Type-ahead search across all providers and models
- **Keyboard Navigation**: Use arrow keys and Enter to navigate quickly
- **Clear Search**: Press `Cmd+K` (Mac) or `Ctrl+K` (Windows/Linux) to clear search

### Troubleshooting

#### Common Issues
- **API Key Not Recognized**: Ensure you're using the correct API key format for each provider
- **Base URL Issues**: Verify the endpoint URL is correct and accessible
- **Model Not Loading**: Check that the provider is enabled and properly configured
- **Environment Variables Not Working**: Restart the application after adding new environment variables

#### Status Indicators
- 🟢 **Green Checkmark**: Provider properly configured and ready to use
- 🔴 **Red X**: Configuration missing or invalid
- 🟡 **Yellow Indicator**: Provider enabled but may need additional setup
- 🔵 **Blue Pencil**: Click to edit configuration

### Supported Providers Overview

#### Cloud Providers
- **OpenAI** - GPT-4, GPT-3.5, and other OpenAI models
- **Anthropic** - Claude 3.5 Sonnet, Claude 3 Opus, and other Claude models
- **Google (Gemini)** - Gemini 1.5 Pro, Gemini 1.5 Flash, and other Gemini models
- **Groq** - Fast inference with Llama, Mixtral, and other models
- **xAI** - Grok models including Grok-2 and Grok-2 Vision
- **DeepSeek** - DeepSeek Coder and other DeepSeek models
- **Mistral** - Mixtral, Mistral 7B, and other Mistral models
- **Cohere** - Command R, Command R+, and other Cohere models
- **Together AI** - Various open-source models
- **Perplexity** - Sonar models for search and reasoning
- **HuggingFace** - Access to HuggingFace model hub
- **OpenRouter** - Unified API for multiple model providers
- **Moonshot (Kimi)** - Kimi AI models
- **Hyperbolic** - High-performance model inference
- **GitHub Models** - Models available through GitHub
- **Amazon Bedrock** - AWS managed AI models

#### Local Providers
- **Ollama** - Run open-source models locally with advanced model management
- **LM Studio** - Local model inference with LM Studio
- **OpenAI-like** - Connect to any OpenAI-compatible API endpoint

> **💡 Pro Tip**: Start with OpenAI or Anthropic for the best results, then explore other providers based on your specific needs and budget considerations.

## Setup Using Git (For Developers only)

This method is recommended for developers who want to:

- Contribute to the project
- Stay updated with the latest changes
- Switch between different versions
- Create custom modifications

#### Prerequisites

1. Install Git: [Download Git](https://git-scm.com/downloads)

#### Initial Setup

1. **Clone the Repository**:

   ```bash
   git clone -b stable https://github.com/stackblitz-labs/dev-lightning.git
   ```

2. **Navigate to Project Directory**:

   ```bash
   cd dev-lightning
   ```

3. **Install Dependencies**:

   ```bash
   pnpm install
   ```

4. **Start the Development Server**:
   ```bash
   pnpm run dev
   ```

5. **(OPTIONAL)** Switch to the Main Branch if you want to use pre-release/testbranch:
   ```bash
   git checkout main
   pnpm install
   pnpm run dev
   ```
  Hint: Be aware that this can have beta-features and more likely got bugs than the stable release

>**Open the WebUI to test (Default: http://localhost:5173)**
>   - Beginners:
>     - Try to use a sophisticated Provider/Model like Anthropic with Claude Sonnet 3.x Models to get best results
>     - Explanation: The System Prompt currently implemented in dev-lightning cant cover the best performance for all providers and models out there. So it works better with some models, then other, even if the models itself are perfect for >programming
>     - Future: Planned is a Plugin/Extentions-Library so there can be different System Prompts for different Models, which will help to get better results

#### Staying Updated

To get the latest changes from the repository:

1. **Save Your Local Changes** (if any):

   ```bash
   git stash
   ```

2. **Pull Latest Updates**:

   ```bash
   git pull
   ```

3. **Update Dependencies**:

   ```bash
   pnpm install
   ```

4. **Restore Your Local Changes** (if any):
   ```bash
   git stash pop
   ```

#### Troubleshooting Git Setup

If you encounter issues:

1. **Clean Installation**:

   ```bash
   # Remove node modules and lock files
   rm -rf node_modules pnpm-lock.yaml

   # Clear pnpm cache
   pnpm store prune

   # Reinstall dependencies
   pnpm install
   ```

2. **Reset Local Changes**:
   ```bash
   # Discard all local changes
   git reset --hard origin/main
   ```

Remember to always commit your local changes or stash them before pulling updates to avoid conflicts.

---

## Available Scripts

- **`pnpm run dev`**: Starts the development server.
- **`pnpm run build`**: Builds the project.
- **`pnpm run start`**: Runs the built application locally using Wrangler Pages.
- **`pnpm run preview`**: Builds and runs the production build locally.
- **`pnpm test`**: Runs the test suite using Vitest.
- **`pnpm run typecheck`**: Runs TypeScript type checking.
- **`pnpm run typegen`**: Generates TypeScript types using Wrangler.
- **`pnpm run deploy`**: Deploys the project to Cloudflare Pages.
- **`pnpm run lint`**: Runs ESLint to check for code issues.
- **`pnpm run lint:fix`**: Automatically fixes linting issues.
- **`pnpm run clean`**: Cleans build artifacts and cache.
- **`pnpm run prepare`**: Sets up husky for git hooks.
- **Docker Scripts**:
  - **`pnpm run dockerbuild`**: Builds the Docker image for development.
  - **`pnpm run dockerbuild:prod`**: Builds the Docker image for production.
  - **`pnpm run dockerrun`**: Runs the Docker container.
  - **`pnpm run dockerstart`**: Starts the Docker container with proper bindings.
- **Electron Scripts**:
  - **`pnpm electron:build:deps`**: Builds Electron main and preload scripts.
  - **`pnpm electron:build:main`**: Builds the Electron main process.
  - **`pnpm electron:build:preload`**: Builds the Electron preload script.
  - **`pnpm electron:build:renderer`**: Builds the Electron renderer.
  - **`pnpm electron:build:unpack`**: Creates an unpacked Electron build.
  - **`pnpm electron:build:mac`**: Builds for macOS.
  - **`pnpm electron:build:win`**: Builds for Windows.
  - **`pnpm electron:build:linux`**: Builds for Linux.
  - **`pnpm electron:build:dist`**: Builds for all platforms.

---

## Contributing

We welcome contributions! Check out our [Contributing Guide](CONTRIBUTING.md) to get started.

---

## Roadmap

Explore upcoming features and priorities on our [Roadmap](https://roadmap.sh/r/ottodev-roadmap-2ovzo).

---

## FAQ

For answers to common questions, issues, and to see a list of recommended models, visit our [FAQ Page](FAQ.md).


# Licensing
**Who needs a commercial WebContainer API license?**

dev-lightning source code is distributed as MIT, but it uses WebContainers API that [requires licensing](https://webcontainers.io/enterprise) for production usage in a commercial, for-profit setting. (Prototypes or POCs do not require a commercial license.) If you're using the API to meet the needs of your customers, prospective customers, and/or employees, you need a license to ensure compliance with our Terms of Service. Usage of the API in violation of these terms may result in your access being revoked.
# Test commit to trigger Security Analysis workflow
