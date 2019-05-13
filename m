Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17BB41B948
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 13 May 2019 16:56:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C79DB89F27;
	Mon, 13 May 2019 14:56:47 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
X-Greylist: delayed 19963 seconds by postgrey-1.36 at gabe;
 Mon, 13 May 2019 14:56:46 UTC
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E163789F27
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 13 May 2019 14:56:46 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x4D9IpkZ099049;
 Mon, 13 May 2019 09:22:59 GMT
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2130.oracle.com with ESMTP id 2sdnttdne0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 13 May 2019 09:22:59 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x4D9LHcr101697;
 Mon, 13 May 2019 09:22:58 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by aserp3020.oracle.com with ESMTP id 2se0tverff-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 13 May 2019 09:22:58 +0000
Received: from abhmp0016.oracle.com (abhmp0016.oracle.com [141.146.116.22])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x4D9Mr5V008481;
 Mon, 13 May 2019 09:22:53 GMT
Received: from mwanda (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 13 May 2019 09:22:52 +0000
Date: Mon, 13 May 2019 12:22:44 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>,
 Aleksei Gimbitskii <aleksei.gimbitskii@intel.com>
Subject: [PATCH] drm/i915/gvt: Fix an error code in
 ppgtt_populate_spt_by_guest_entry()
Message-ID: <20190513092244.GA12077@mwanda>
MIME-Version: 1.0
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=9255
 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1905130067
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=9255
 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1905130067
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2018-07-02;
 bh=xfkjogPojG0Pm/y32JShR1cqog8lZbULmD215jD6V3U=;
 b=UgeVz5jDUzHOOuxdzbFTOs5nEOIT8kpt5vIF5U/s2eDs3ckcufExBUZ9veT4sFG0sa4M
 eMyM9b+/WFwZi8wDdw2kgzifye6QLtmoNLarIpbHAsb480Y4fg/37tLwTQJElGz49L1R
 PE45MJaHoo89rnavKmuXkOfx6g11g4RkkluLqAPhxbNabevRHjgjS/uiNyljCf1GeRZl
 Q3dw0vanSAaDfgyAbnDRBvbYKoupIQDjPrKMRmEmqi2pbkRab/S4yMkEwlFQwdmxHENT
 hdsVY+SLOeDCajstpAHC5xAg9Qrg1VltTMQItP3gDSQ3VM6f5lt+e4lebNpfID4cPXKA 0Q== 
X-BeenThere: intel-gvt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 kernel-janitors@vger.kernel.org, Jani Nikula <jani.nikula@linux.intel.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 intel-gvt-dev@lists.freedesktop.org, Zhi Wang <zhi.a.wang@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

InJldCIgaXMgdW5pbml0aWFsaXplZCBvbiB0aGlzIHBhdGggYnV0IGl0IHNob3VsZCBiZSAtRUlO
VkFMLgoKRml4ZXM6IDkzMGM4ZGZlYTRiOCAoImRybS9pOTE1L2d2dDogQ2hlY2sgaWYgZ2V0X25l
eHRfcHRfdHlwZSgpIGFsd2F5cyByZXR1cm5zIGEgdmFsaWQgdmFsdWUiKQpTaWduZWQtb2ZmLWJ5
OiBEYW4gQ2FycGVudGVyIDxkYW4uY2FycGVudGVyQG9yYWNsZS5jb20+Ci0tLQogZHJpdmVycy9n
cHUvZHJtL2k5MTUvZ3Z0L2d0dC5jIHwgNCArKystCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRp
b25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUv
Z3Z0L2d0dC5jIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2d0dC5jCmluZGV4IDA4Yzc0ZTY1
ODM2Yi4uMjQ0YWQxNzI5NzY0IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQv
Z3R0LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2d0dC5jCkBAIC0xMDc2LDggKzEw
NzYsMTAgQEAgc3RhdGljIHN0cnVjdCBpbnRlbF92Z3B1X3BwZ3R0X3NwdCAqcHBndHRfcG9wdWxh
dGVfc3B0X2J5X2d1ZXN0X2VudHJ5KAogCX0gZWxzZSB7CiAJCWludCB0eXBlID0gZ2V0X25leHRf
cHRfdHlwZSh3ZS0+dHlwZSk7CiAKLQkJaWYgKCFndHRfdHlwZV9pc19wdCh0eXBlKSkKKwkJaWYg
KCFndHRfdHlwZV9pc19wdCh0eXBlKSkgeworCQkJcmV0ID0gLUVJTlZBTDsKIAkJCWdvdG8gZXJy
OworCQl9CiAKIAkJc3B0ID0gcHBndHRfYWxsb2Nfc3B0X2dmbih2Z3B1LCB0eXBlLCBvcHMtPmdl
dF9wZm4od2UpLCBpcHMpOwogCQlpZiAoSVNfRVJSKHNwdCkpIHsKLS0gCjIuMTguMAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0LWRldiBt
YWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2
