# uRV compilation tool test

🚚 Test to check the following container: 🚚

- `ghcr.io/unike267/containers/urv-toolchain:latest` 

Through compilation of the `wrc` from `ohwr/project/wrpc-sw` and `sw/hello` program from `ohwr/project/urv-core` RISC-V core 🚀. 

- Sources: 
  - [wrpc-sw](https://gitlab.com/ohwr/project/wrpc-sw)
  - [urv-core](https://gitlab.com/ohwr/project/urv-core), [sw/hello](https://gitlab.com/ohwr/project/urv-core/-/tree/master/sw/hello).

**Goals:**

- Compile `wrc` through the container. The results are available in the repository's [actions](https://github.com/Unike267/Containers/actions) section.
    - Workflow: `uRV-Toolchain-Container` 
      - Job: `urv-toolchain-test_wrc_and_urv_hello_sw`
        - Artifact names:
          - `wrc.vhd` 
          - `wrc.bin` 
          - `wrc.bram` 

- Compile the example program `sw/hello` through the container. The result is available in the repository's [actions](https://github.com/Unike267/Containers/actions) section.
    - Workflow: `uRV-Toolchain-Container` 
      - Job: `urv-toolchain-test_wrc_and_urv_hello_sw`
        - Artifact name:
          - `hello.ram` 

