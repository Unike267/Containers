# USER GUIDE for implementation on Xilinx FPGAs (Arty A7 35T & 100T) with FLOS container

The **goal** of this repository is to build 🔨 and push 📤 in continuous integration ♻️ a USER GUIDE to specify how to use `ghcr.io/unike267/containers/impl-arty:latest` container.

📢 In this repository will be available the TeX code of the USER's GUIDE. 📢

- To perform the generation of the PDF document the `ghcr.io/unike267/containers/latex-pygments:latest` container is used.
    - This container has: `latex` compiler with `pygments` program to use `minted` package.

- The compiled PDF document is available in the [actions](https://github.com/Unike267/Containers/actions) of this repository.
    - Through the `user_guide` workflow (branch `Impl-FLOS-UG`).
        - Click in the `action runs` and download PDF (it's as an artifact)



