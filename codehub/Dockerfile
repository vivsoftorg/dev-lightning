FROM codercom/code-server:4.108.2-39

WORKDIR /home/coder/projects
ENV CS_DISABLE_GETTING_STARTED_OVERRIDE=1

# Install OpenCode
RUN curl -fsSL https://opencode.ai/install | bash

# RUN curl -fsSL https://claude.ai/install | bash

# Install VS Code extensions in a single layer
RUN code-server --install-extension sst-dev.opencode

# RUN code-server --install-extension anthropic.claude-code
