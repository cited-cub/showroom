#!/bin/bash
postconf -p smtpd_enforce_tls
postconf -p smtpd_tls_loglevel
postconf -p smtpd_use_tls
postconf -p smtpd_tls_key_file
postconf -p smtpd_tls_cert_file

