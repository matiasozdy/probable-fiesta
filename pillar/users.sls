users:
  userone:
    fullname: userone
    enforce_password: True
    empty_password: True
    createhome: True
    shell: /bin/bash
    ssh_key_type: rsa
    ssh_auth_sources:
      - salt://keys/your_name.id_rsa.pub
  usertwo:
    fullname: usertwo
    enforce_password: True
    empty_password: True
    createhome: True
    shell: /bin/bash
    ssh_key_type: rsa
    ssh_auth_sources:
      - salt://keys/your_name.id_rsa.pub
  userthree:
    fullname: userthree
    enforce_password: True
    empty_password: True
    createhome: True
    shell: /bin/bash
    ssh_key_type: rsa
    ssh_auth_sources:
      - salt://keys/your_name.id_rsa.pub
