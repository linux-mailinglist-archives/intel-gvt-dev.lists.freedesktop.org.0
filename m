Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC8DD80781C
	for <lists+intel-gvt-dev@lfdr.de>; Wed,  6 Dec 2023 19:52:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF63D10E7A0;
	Wed,  6 Dec 2023 18:52:29 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from lhr.gtn-esa2.in (gtnesa2.ptcl.net [59.103.87.20])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6BEBA10E78E;
 Wed,  6 Dec 2023 18:52:26 +0000 (UTC)
Message-Id: <573856$1hl6ol@lhr.gtn-esa2.in>
X-IPAS-Result: =?us-ascii?q?A2EsDAAywnBl/0+gtbZaHQEBAQEJARIBBQUBQAmBRgKFD?=
 =?us-ascii?q?4RTqR2GRxOBag8BAQEBAQEBAQFNBAEBhQaHLSc6BA0BAgQBAQEBAwIDAQEBA?=
 =?us-ascii?q?QEBAwEBAQUBAQEBAQEGAwECAoEZhS9Ghk0nVigNAhkNAkkWE4Vfrw6BMhpnh?=
 =?us-ascii?q?F+xTi4Bgm6FHwGBUIQIkBABEgGDfBWCUwSJFwcyhUopiTqGegcCBXBHcBsDB?=
 =?us-ascii?q?wN/DysHBC0iBgkULSMGUQQoIQkTEj4Ea4JECoECPw8OEYI9YTYZSIJbFQw0S?=
 =?us-ascii?q?nUQQheBEW4bEx43ERIXDQMIdB0CMjwDBQMEMwoSDQshBVYDRQZJCwMCGgUDA?=
 =?us-ascii?q?wSBMwUNHgIQLCcDAxJJAhAUAzsDAwYDCzEDMIEZDE8Dax82CTwPDB8COQ0nI?=
 =?us-ascii?q?wIsVgUSAhYDJBo2EQkLKAMvBjsCEwwGBgleJhYJBCcDCAQDXAsDMxEdNwkDe?=
 =?us-ascii?q?D01CAwbRAhHHRKjNXgBgUdEgRAhhUKNdoNoih6DTqBOB44Sm0cBk14DkjZHh?=
 =?us-ascii?q?ziEaotZIKo1DX9whCdSGaItaTsCBwsBAQMJimIBAQ?=
IronPort-Data: A9a23:9yOLxKnLKSVVKOFqcOFlMdLo5gxkJkRdPkR7XQ2eYbSJt1+Wr1Gzt
 xIfCGnQPvqKYTenKNglPIu1/UkHvpTRyNJkSgdurX01Ri4T+ZvOCP2ndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oDJ9CU6jefSLlbFILas1hpZHGeIcw9/z0o/8wIFqtQw24PgWVvT4
 YiaT/D3YTdJ5RYlagr41Ire8HuDjNyq0N/PlgVjDRzjlAa2e0g9VPrzF4noR5fLatA88tqBe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 NpltsGTQFoRZLPwl+FeDEN6KiR8fpdnweqSSZS/mZT7I0zuT0Cq2/xoSVk/NowW++0xCmZLs
 +AHQNwPRknT3aTvkOv9E7c0wJtyRCXoFNp3VnVI5CvYA7AFQZnFa73W7tse2joswNhNdRrbT
 5dDMWUyNkSdC/FJElBUMr8/wOaOuj68fQEGmVjKn4gd7GeGmWSd15CoarI5YOeiSthcmEmJu
 yTZ9mL2WE0yO9mWyD7D+XWp7sfdnT75WYsUG6C/3vhohUDVy2AOThYQPXO/oOi4jEGWUtRbK
 kgd5Wwlqq1a3FyvXsTVVhu8oXqNoVgXXN84O+k79R2EzYLd5QKYAmEbCDVGbbQOsNIxVDUt4
 VaNh9PgLTtyrLmSTnHb/bCRxRu1KDgUJGgNeCYCQiMK5tDipMc4iRenZtlsAL6lk/WsQ2+2y
 DePxAA/jr4Ly9EG3aCy5kzKmRqjo5HISkg+4QC/dmak6B5pIY2ofYql7R3c8vBNNq6HQVSb+
 nsJgc6T6KYJF57lvDyMSeICAbiv6LCOMDDaqV9pA5QlsT+q/haLfIZM7TU7K0l5GsIFYiPyJ
 kHJtA5d6YRQIHyyK6htbOqZCsI2wKylGsr5E/zZcPJKY4Ntb0mJ5ixjaUOL3HzqiA4ri65XE
 YWbcIClS2kTD6tPzTyqSuNb2rgurggsxW7VVI3k5xCm16eOIn+TVboBdlCJa4gR/qOFsRjc9
 ZBbKeOLzQlSVKv1ZSy/2Y0eM1EMa2Q6DJbeqspLe+rFKQ1jcEkxTfjM0LondKRugqRW0OrE4
 ze9WSdw2lr2gnnGIAOFYXBubpvrXJB863kmPS9qMFq1nXggCbtD949GJ8FxJOl+srU9lbgrH
 pHpZvm9PxiGcRyfkxx1UHU3hNYKmMiD7e5FA8ZpjPXTsXKtq8wlN+IIpjfSyRQ=
IronPort-HdrOrdr: A9a23:dJEpC6NjUEN/qMBcTtGjsMiBIKoaSvp037Dk7SBModU8SKClfq
 eV8cjztCWetN9/YgBCpTntAsi9qBDnn6KdiLN5VYtKOjOW2ldAR7sM0WKN+VPdJxE=
X-Talos-CUID: 9a23:XnwzD21ljDM6cZltvjevNLxfGZ0GeyDllmnsLEr7VjxLcbiXCmWxwfYx
X-Talos-MUID: 9a23:Bs9MQQaBFnnTQeBTsHzWqTA+NeFUpOegNB48m8o8meOLOnkl
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.04,256,1695668400"; d="scan'208";a="52075285"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO TS.pan-pacific.com.tw) ([182.181.160.79])
 by lhr.gtn-esa2.in with ESMTP; 06 Dec 2023 23:52:14 +0500
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Description: Mail message body
Subject: #Congrat!!
To: "t.maruyama@n-mtec.co.jp" <Arif.Khan@ptcl.net.pk>
From: <Arif.Khan@ptcl.net.pk>
Date: Thu, 07 Dec 2023 02:52:01 +0800
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
Reply-To: grantsprogram@cpn.it
Cc: asghar.meo@ptcl.net.pk
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Congrat!!

Ref No: BEH/XGM/012/0023.

Your email address was chosen at random during an internet search to receiv=
e USD 805,000.00 from me, the chairman and CEO of Berkshire Hathaway. If yo=
u are interested respond promptly via this e-mail:{grantsprogram@cpn.it} to=
 learn more about the donation and how to claim it.

Regards,
Warren Edward Buffett
