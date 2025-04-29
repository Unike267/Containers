# lm32 compilation tool test

🚚 Test to check the following container: 🚚

- `ghcr.io/unike267/containers/lm32-toolchain:latest` 

Through compilation of the `wrc` from `ohwr/project/wrpc-sw`.

- Sources: 
  - [wrpc-sw](https://gitlab.com/ohwr/project/wrpc-sw)

**Goals:**

- Compile `wrc` through the container. The results are available in the repository's [actions](https://github.com/Unike267/Containers/actions) section.
    - Workflow: `lm32-Toolchain-Container` 
      - Job: `lm32-toolchain-test`
        - Artifact names:
          - `wrc.vhd` 
          - `wrc.bin` 
          - `wrc.bram` 

