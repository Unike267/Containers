# uRV compilation tool test

🚚 Test to check the following container: 🚚

- `ghcr.io/unike267/containers/urv-sw-tool-spec-def:latest` 

Through compilation of the `wrc` from `ohwr.org/project/wrpc-sw` and `sw/hello` program from `ohwr.org/project/urv-core` RISC-V core 🚀. 

- Sources: 
  - [wrpc-sw](https://ohwr.org/project/wrpc-sw)
  - [urv-core](https://ohwr.org/project/urv-core), [sw/hello](https://ohwr.org/project/urv-core/-/tree/master/sw/hello?ref_type=heads).

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

