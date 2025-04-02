# uRV compilation tool test

🚚 Test to check the following container: 🚚

- `ghcr.io/unike267/containers/urv-sw-tool-spec-def:latest` 

Through compilation of the `wrc` from `ohwr.org/project/wrpc-sw` and `sw/hello` program from `ohwr.org/project/urv-core` RISC-V core 🚀. 

- Sources: 
  - [wrpc-sw](https://ohwr.org/project/wrpc-sw)
  - [urv-core](https://ohwr.org/project/urv-core), [sw/hello](https://ohwr.org/project/urv-core/-/tree/master/sw/hello?ref_type=heads).

**Goal:**

- Compile wrc through the container.

- Compile the example program `sw/hello` through the container.

- This compiled program `wrc` is available in the repository [actions](https://github.com/Unike267/Containers/actions).
    - Workflow: `urv-toolchain-test` 
    - Artifact names:
        - `wrc.vhd` 
        - `wrc.bin` 
        - `wrc.bram` 

- This compiled program `main.o` is available in the repository [actions](https://github.com/Unike267/Containers/actions).
    - Workflow: `urv-toolchain-test` 
    - Artifact names:
        - `main.o` 

