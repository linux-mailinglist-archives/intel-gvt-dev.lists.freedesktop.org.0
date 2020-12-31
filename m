Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D6162E7FA8
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 31 Dec 2020 12:32:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BB8C89B06;
	Thu, 31 Dec 2020 11:32:48 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com
 [IPv6:2607:f8b0:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0299689B06
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 31 Dec 2020 11:32:46 +0000 (UTC)
Received: by mail-pg1-x52d.google.com with SMTP id i7so12956952pgc.8
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 31 Dec 2020 03:32:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:date:list-unsubscribe:mime-version:from:to:subject
 :content-transfer-encoding;
 bh=mHlVeBmV30BlL9WQgH9iBo+8ceS6LsUZOoNrgHMwm1E=;
 b=u3SbJTKL50g3PpreKMis8o/zu9wI79/u9XultSeuYchQNXgY90wmiEY81DtHb0IKML
 zdiI7H8lhmb8vdr1nduyrBXygXSr7UWW15Oj8GW4iUyzwnWxFChLfEMA4UpBpQD5jtLO
 12J8x6qN60ARuZkGpPKBlAuueNrZdzggpLPIb3Jj5oT3UQCFPrPkU/pM1UlUGRqJY1Pw
 xHuVEJdwq73eOwptJDNXUfigPQlSDuwYzkwMItSjRXPZgXYLQDzZW+uQtOOCbJ6qKPoH
 onQ5g/fhmn/9OYkcQh1q7HY5UU+qEtqRHM0jdLFhGM9LntYYvfvD8tDsz2uXdOMnKNMG
 7TeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:date:list-unsubscribe:mime-version
 :from:to:subject:content-transfer-encoding;
 bh=mHlVeBmV30BlL9WQgH9iBo+8ceS6LsUZOoNrgHMwm1E=;
 b=VkEYVRuC47ffCNTRY9PYhTovJgaSsteZIrbE0ov8irMmQgCtNLroD15v4nRDPgtf7b
 A571GA3K6p6K5rNZCX0H58Eifu3T5m7E7SoHVaS5wpmc0r2kpTvobIBaTTSnqo8+N2Ms
 A/9MoR0rN46qFiOO4Xa93KbdYM4imozaDtve7BlWZNynSpomr+hlwVurB1nvUABa6CTq
 MMAzA5Rn4pC9vwlzeVxw1PW+0r1wCx+3zyPHHnx1HszZ5W1Ij8YxTQ8Vz3fRC51wKlJb
 ptJq7JRLWILAgt+648bU0mFg9dS+PYC2GWqx308NCrCF0zT1ru5arJyL4Lck2RKbsbT4
 7FVw==
X-Gm-Message-State: AOAM530rWZa1zNcgMIlDKXKErLH7iTfAZcoTcThVGcNgVoz3bKZHIWQv
 /VZb3Mv3oDh6eqj/O50co+6KjOo3Z9M=
X-Google-Smtp-Source: ABdhPJyV2vbFI0iX0bJmW1qUSb2KCH2PX9EC0YmcZaP2IBspaCzCg/DuBzRdhLNO3W7skH/BC20dWw==
X-Received: by 2002:a65:6409:: with SMTP id a9mr55619776pgv.171.1609414366422; 
 Thu, 31 Dec 2020 03:32:46 -0800 (PST)
Received: from DESKTOP-DI4367S ([27.3.184.35])
 by smtp.gmail.com with ESMTPSA id h1sm35333783pgj.59.2020.12.31.03.32.45
 for <intel-gvt-dev@lists.freedesktop.org>
 (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
 Thu, 31 Dec 2020 03:32:45 -0800 (PST)
Message-ID: <5fedb6dd.1c69fb81.3248.25d5@mx.google.com>
Date: Thu, 31 Dec 2020 03:32:45 -0800 (PST)
X-Google-Original-Date: 31 Dec 2020 18:32:43 +0700
MIME-Version: 1.0
From: "Anne" <chantuonggiang1@gmail.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: =?utf-8?B?aW50ZWwtZ3Z0LWRldj/pkrHotKLjgIHnpo/lvrfkuI7ngb7n?=
 =?utf-8?B?pbghRnJvbSBBbm5lLg==?=
X-BeenThere: intel-gvt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "Intel GVT \(Graphics Virtualization\) development list"
 <intel-gvt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gvt-dev>, 
 <mailto:intel-gvt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gvt-dev>
List-Post: <mailto:intel-gvt-dev@lists.freedesktop.org>
List-Help: <mailto:intel-gvt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev>, 
 <mailto:intel-gvt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1457691501=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

--===============1457691501==
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: base64

PENFTlRFUj4KPHA+PGRpdiBzdHlsZT0iZm9udC1zaXplOiAyN3B4OyBmb250LWZhbWls
eTogdmVyZGFuYSwgYXJpYWwsIGhlbHZldGljYSwgc2Fucy1zZXJpZjsgYmFja2dyb3Vu
ZC1jb2xvcjogcmdiKDI1NSwgMjU1LCAyNTUpIj48Zm9udCBjb2xvcj0iIzAwMDBjYyI+
PGEgaHJlZj0iaHR0cDovL3RoZXVvY3h1YS5jb20vZ2V0ZG9jdW1lbnRzL1Q3NUtXY0py
NW11OWN4QUFBQXRtQXZvWXhieXRET0FzOHU3SE45bHpmUjRVQnpQSTVCRWpmUDJ2TTA2
dFdBQUFBZmx3WUpkZlA0WWdLVFhnN1NQQUFOcG9INGFnPT0vMmR4ZlpCQkJCOHQzRXpi
bHZPWWRmOVBQdz09L2ludGVsLWd2dC1kZXY/6ZKx6LSi44CB56aP5b635LiO54G+56W4
IUZyb20gQW5uZS4iIHRhcmdldD0iX2JsYW5rIiByZWw9Im5vcmVmZXJyZXIiPlRoZSB0
cnV0aC5pbmZvPC9hPjwvZm9udD48L2Rpdj4KPGRpdj4KPGltZyBzcmM9Imh0dHA6Ly90
aGV1b2N4dWEuY29tL2dldGRvY3VtZW50cy9UNzVLV2NKcjVtdTljeEFBQUF0bUF2b1l4
Ynl0RE9Bczh1N0hOOWx6ZlI0VUJ3bjVyYzJVZ01qVHh6RlNlNWJNVzFkdWJvQXl0Tlc5
UngxOVpxUktRb3RWNzB3ZjB0TURqQkJCQmxqS2twUmt3ZkpVcz0vOE13dHZXOGg0NFZC
QkJCbnAySzRXYW9pUGRaemhKU3hCQkJCUVh1ZTN2NlFwT2VVMFpPUW9IQnpOU2QwMkpt
b2FYc2s0TS9pbnRlbC1ndnQtZGV2P+mSsei0ouOAgeemj+W+t+S4jueBvueluCFGcm9t
IEFubmUuIj4KPGltZyBzcmM9Imh0dHA6Ly90aGV1b2N4dWEuY29tL2dldGRvY3VtZW50
cy9UNzVLV2NKcjVtdTljeEFBQUF0bUF2b1l4Ynl0RE9Bczh1N0hOOWx6ZlI0VUJ6UEk1
QkVqZlAydk0wNnRXQUFBQWZsd1lKZGZQNFlnS1RYZzdTUEFBTnBvSDRhZz09L0RtS3BZ
UVVReDJtOUdaR1RzRGkzQmVONU5jMXMxOVhpRDhoM1JoSmh1OTJEYjhuMnBXV0FLbVBC
QkJCOGUzb3dCVnovaW50ZWwtZ3Z0LWRldj/pkrHotKLjgIHnpo/lvrfkuI7ngb7npbgh
RnJvbSBBbm5lLiI+CjxpbWcgc3JjPSJodHRwOi8vdGhldW9jeHVhLmNvbS9nZXRkb2N1
bWVudHMvVDc1S1djSnI1bXU5Y3hBQUFBdG1Bdm9ZeGJ5dERPQXM4dTdITjlsemZSNFVC
elBJNUJFamZQMnZNMDZ0V0FBQUFmbHdZSmRmUDRZZ0tUWGc3U1BBQU5wb0g0YWc9PS9R
aUtxY3dKVUJCQkJMVjJWSmg3b1IxQTMzM0FvNWJuVFRnd1dXNGIxYUhjRndsV2FHYUhS
Q2h5a3lwNVptSnJKZlpFWG9aYWlQWG83TldubjJ2NHVaQUFBQVZWY05KN2tNdW53WU9P
WlBmNkFBQUFOdWxwMD0vaW50ZWwtZ3Z0LWRldj/pkrHotKLjgIHnpo/lvrfkuI7ngb7n
pbghRnJvbSBBbm5lLiI+CjxpbWcgc3JjPSJodHRwOi8vdGhldW9jeHVhLmNvbS9nZXRk
b2N1bWVudHMvVDc1S1djSnI1bXU5Y3hBQUFBdG1Bdm9ZeGJ5dERPQXM4dTdITjlsemZS
NFVCelBJNUJFamZQMnZNMDZ0V0FBQUFmbHdZSmRmUDRZZ0tUWGc3U1BBQU5wb0g0YWc9
PS9RaUtxY3dKVUJCQkJMVjJWSmg3b1IxQTMzM0FvNWJuVFRnd1dXNGIxYUhjRndrMUlN
cmw0bnFrdWJQRENiQjVpdUhKUEJCQkI5YkQ1UXBVY1RuV1dlcnAyYUFVdjJrQ3BxOUJa
UmdOMHJMQU9QdG90MD0vaW50ZWwtZ3Z0LWRldj/pkrHotKLjgIHnpo/lvrfkuI7ngb7n
pbghRnJvbSBBbm5lLiI+CjxpbWcgc3JjPSJodHRwOi8vdGhldW9jeHVhLmNvbS9nZXRk
b2N1bWVudHMvVDc1S1djSnI1bXU5Y3hBQUFBdG1Bdm9ZeGJ5dERPQXM4dTdITjlsemZS
NFVCelBJNUJFamZQMnZNMDZ0V0FBQUFmbHdZSmRmUDRZZ0tUWGc3U1BBQU5wb0g0YWc9
PS9RaUtxY3dKVUJCQkJMVjJWSmg3b1IxQTMzM0FvNWJuVFRnd1dXNGIxYUhjRndrenpU
MVFGNXNGaUxZSDBRMFg2cDBiR05JR0V2cEJEZkVINUc5QVJLZHA0VjA2aEUyeFdYc1U5
QzFiTGlCWm9CQkJCVT0vaW50ZWwtZ3Z0LWRldj/pkrHotKLjgIHnpo/lvrfkuI7ngb7n
pbghRnJvbSBBbm5lLiI+CjxkaXY+CjxlbT4q5YW25LuW5paH5Lu2OjwvZW0+PGJyIC8+
CjxlbT5odHRwczovL3d3dy5tZWRpYWZpcmUuY29tL2ZvbGRlci9pbmoydmVkd2U3Y2oz
PC9lbT48YnIgLz4KPGVtPmh0dHA6Ly9jb2R1eWVuLmluZm8vbWgvMDAvOSZwaV9uLmcu
cGRmPC9lbT48YnIgLz4=


--===============1457691501==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--===============1457691501==--
