Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6A46343AC
	for <lists+intel-gvt-dev@lfdr.de>; Tue,  4 Jun 2019 12:04:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9620589733;
	Tue,  4 Jun 2019 10:04:34 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F27A897D7
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue,  4 Jun 2019 10:04:33 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 04 Jun 2019 03:04:33 -0700
X-ExtLoop1: 1
Received: from gvt.bj.intel.com ([10.238.158.187])
 by orsmga007.jf.intel.com with ESMTP; 04 Jun 2019 03:04:31 -0700
From: Tina Zhang <tina.zhang@intel.com>
To: intel-gvt-dev@lists.freedesktop.org,
	qemu-devel@nongnu.org
Subject: [RFC PATCH 3/3] vfio/display: Refresh display depending on vGPU page
 flip events
Date: Tue,  4 Jun 2019 17:58:47 +0800
Message-Id: <20190604095847.10532-4-tina.zhang@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190604095847.10532-1-tina.zhang@intel.com>
References: <20190604095847.10532-1-tina.zhang@intel.com>
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
Cc: kevin.tian@intel.com, zhenyuw@linux.intel.com,
 Tina Zhang <tina.zhang@intel.com>, alex.williamson@redhat.com,
 zhiyuan.lv@intel.com, hang.yuan@intel.com, zhi.a.wang@intel.com,
 kraxel@redhat.com
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

VXNlIHZHUFUgcGxhbmUgcGFnZSBmbGlwIGV2ZW50cyB0byByZWZyZXNoIGRpc3BsYXkuCgpTaWdu
ZWQtb2ZmLWJ5OiBUaW5hIFpoYW5nIDx0aW5hLnpoYW5nQGludGVsLmNvbT4KLS0tCiBody92Zmlv
L2Rpc3BsYXkuYyAgICAgICAgICAgICB8IDI0OSArKysrKysrKysrKysrKysrKysrKysrKysrKysr
Ky0tLS0tCiBpbmNsdWRlL2h3L3ZmaW8vdmZpby1jb21tb24uaCB8ICAgOCArKwogMiBmaWxlcyBj
aGFuZ2VkLCAyMjUgaW5zZXJ0aW9ucygrKSwgMzIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
aHcvdmZpby9kaXNwbGF5LmMgYi9ody92ZmlvL2Rpc3BsYXkuYwppbmRleCAyYzJkM2U1YjcxLi42
ZWYzODNiNWU4IDEwMDY0NAotLS0gYS9ody92ZmlvL2Rpc3BsYXkuYworKysgYi9ody92ZmlvL2Rp
c3BsYXkuYwpAQCAtMjg4LDQ0ICsyODgsNTQgQEAgc3RhdGljIHZvaWQgdmZpb19kaXNwbGF5X2Rt
YWJ1Zl91cGRhdGUodm9pZCAqb3BhcXVlKQogICAgIFZGSU9ETUFCdWYgKnByaW1hcnksICpjdXJz
b3I7CiAgICAgYm9vbCBmcmVlX2J1ZnMgPSBmYWxzZSwgbmV3X2N1cnNvciA9IGZhbHNlOzsKIAot
ICAgIHByaW1hcnkgPSB2ZmlvX2Rpc3BsYXlfZ2V0X2RtYWJ1Zih2ZGV2LCBEUk1fUExBTkVfVFlQ
RV9QUklNQVJZKTsKLSAgICBpZiAocHJpbWFyeSA9PSBOVUxMKSB7Ci0gICAgICAgIGlmIChkcHkt
PnJhbWZiKSB7Ci0gICAgICAgICAgICByYW1mYl9kaXNwbGF5X3VwZGF0ZShkcHktPmNvbiwgZHB5
LT5yYW1mYik7Ci0gICAgICAgIH0KLSAgICAgICAgcmV0dXJuOworICAgIGlmIChkcHktPmV2ZW50
X2ZsYWdzICYgVkZJT19JUlFfRVZFTlRfRU5BQkxFKSB7CisgICAgICAgIGRweV91cGRhdGVfaW50
ZXJ2YWwoZHB5LT5jb24sIEdVSV9SRUZSRVNIX0lOVEVSVkFMX0lETEUpOwogICAgIH0KIAotICAg
IGlmIChkcHktPmRtYWJ1Zi5wcmltYXJ5ICE9IHByaW1hcnkpIHsKLSAgICAgICAgZHB5LT5kbWFi
dWYucHJpbWFyeSA9IHByaW1hcnk7Ci0gICAgICAgIHFlbXVfY29uc29sZV9yZXNpemUoZHB5LT5j
b24sCi0gICAgICAgICAgICAgICAgICAgICAgICAgICAgcHJpbWFyeS0+YnVmLndpZHRoLCBwcmlt
YXJ5LT5idWYuaGVpZ2h0KTsKLSAgICAgICAgZHB5X2dsX3NjYW5vdXRfZG1hYnVmKGRweS0+Y29u
LCAmcHJpbWFyeS0+YnVmKTsKLSAgICAgICAgZnJlZV9idWZzID0gdHJ1ZTsKLSAgICB9CisgICAg
aWYgKCFkcHktPmV2ZW50X2ZsYWdzIHx8CisgICAgICAgIChkcHktPmV2ZW50X2ZsYWdzICYgVkZJ
T19JUlFfRVZFTlRfUFJJTVJBWV9QTEFORV9GTElQKSkgeworICAgICAgICBwcmltYXJ5ID0gdmZp
b19kaXNwbGF5X2dldF9kbWFidWYodmRldiwgRFJNX1BMQU5FX1RZUEVfUFJJTUFSWSk7CisgICAg
ICAgIGlmIChwcmltYXJ5ID09IE5VTEwpIHsKKyAgICAgICAgICAgIGlmIChkcHktPnJhbWZiKSB7
CisgICAgICAgICAgICAgICAgcmFtZmJfZGlzcGxheV91cGRhdGUoZHB5LT5jb24sIGRweS0+cmFt
ZmIpOworICAgICAgICAgICAgfQorICAgICAgICAgICAgcmV0dXJuOworICAgICAgICB9CiAKLSAg
ICBjdXJzb3IgPSB2ZmlvX2Rpc3BsYXlfZ2V0X2RtYWJ1Zih2ZGV2LCBEUk1fUExBTkVfVFlQRV9D
VVJTT1IpOwotICAgIGlmIChkcHktPmRtYWJ1Zi5jdXJzb3IgIT0gY3Vyc29yKSB7Ci0gICAgICAg
IGRweS0+ZG1hYnVmLmN1cnNvciA9IGN1cnNvcjsKLSAgICAgICAgbmV3X2N1cnNvciA9IHRydWU7
Ci0gICAgICAgIGZyZWVfYnVmcyA9IHRydWU7CisgICAgICAgIGlmIChkcHktPmRtYWJ1Zi5wcmlt
YXJ5ICE9IHByaW1hcnkpIHsKKyAgICAgICAgICAgIGRweS0+ZG1hYnVmLnByaW1hcnkgPSBwcmlt
YXJ5OworICAgICAgICAgICAgcWVtdV9jb25zb2xlX3Jlc2l6ZShkcHktPmNvbiwKKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgcHJpbWFyeS0+YnVmLndpZHRoLCBwcmltYXJ5LT5idWYu
aGVpZ2h0KTsKKyAgICAgICAgICAgIGRweV9nbF9zY2Fub3V0X2RtYWJ1ZihkcHktPmNvbiwgJnBy
aW1hcnktPmJ1Zik7CisgICAgICAgICAgICBmcmVlX2J1ZnMgPSB0cnVlOworICAgICAgICB9CiAg
ICAgfQogCi0gICAgaWYgKGN1cnNvciAmJiAobmV3X2N1cnNvciB8fCBjdXJzb3ItPmhvdF91cGRh
dGVzKSkgewotICAgICAgICBib29sIGhhdmVfaG90ID0gKGN1cnNvci0+aG90X3ggIT0gMHhmZmZm
ZmZmZiAmJgotICAgICAgICAgICAgICAgICAgICAgICAgIGN1cnNvci0+aG90X3kgIT0gMHhmZmZm
ZmZmZik7Ci0gICAgICAgIGRweV9nbF9jdXJzb3JfZG1hYnVmKGRweS0+Y29uLCAmY3Vyc29yLT5i
dWYsIGhhdmVfaG90LAotICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjdXJzb3ItPmhvdF94
LCBjdXJzb3ItPmhvdF95KTsKLSAgICAgICAgY3Vyc29yLT5ob3RfdXBkYXRlcyA9IDA7Ci0gICAg
fSBlbHNlIGlmICghY3Vyc29yICYmIG5ld19jdXJzb3IpIHsKLSAgICAgICAgZHB5X2dsX2N1cnNv
cl9kbWFidWYoZHB5LT5jb24sIE5VTEwsIGZhbHNlLCAwLCAwKTsKLSAgICB9CisgICAgaWYgKCFk
cHktPmV2ZW50X2ZsYWdzIHx8CisgICAgICAgIChkcHktPmV2ZW50X2ZsYWdzICYgVkZJT19JUlFf
RVZFTlRfQ1VSU09SX1BMQU5FX0ZMSVApKSB7CisgICAgICAgIGN1cnNvciA9IHZmaW9fZGlzcGxh
eV9nZXRfZG1hYnVmKHZkZXYsIERSTV9QTEFORV9UWVBFX0NVUlNPUik7CisgICAgICAgIGlmIChk
cHktPmRtYWJ1Zi5jdXJzb3IgIT0gY3Vyc29yKSB7CisgICAgICAgICAgICBkcHktPmRtYWJ1Zi5j
dXJzb3IgPSBjdXJzb3I7CisgICAgICAgICAgICBuZXdfY3Vyc29yID0gdHJ1ZTsKKyAgICAgICAg
ICAgIGZyZWVfYnVmcyA9IHRydWU7CisgICAgICAgIH0KKworICAgICAgICBpZiAoY3Vyc29yICYm
IChuZXdfY3Vyc29yIHx8IGN1cnNvci0+aG90X3VwZGF0ZXMpKSB7CisgICAgICAgICAgICBib29s
IGhhdmVfaG90ID0gKGN1cnNvci0+aG90X3ggIT0gMHhmZmZmZmZmZiAmJgorICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBjdXJzb3ItPmhvdF95ICE9IDB4ZmZmZmZmZmYpOworICAgICAgICAg
ICAgZHB5X2dsX2N1cnNvcl9kbWFidWYoZHB5LT5jb24sICZjdXJzb3ItPmJ1ZiwgaGF2ZV9ob3Qs
CisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjdXJzb3ItPmhvdF94LCBjdXJzb3It
PmhvdF95KTsKKyAgICAgICAgICAgIGN1cnNvci0+aG90X3VwZGF0ZXMgPSAwOworICAgICAgICB9
IGVsc2UgaWYgKCFjdXJzb3IgJiYgbmV3X2N1cnNvcikgeworICAgICAgICAgICAgZHB5X2dsX2N1
cnNvcl9kbWFidWYoZHB5LT5jb24sIE5VTEwsIGZhbHNlLCAwLCAwKTsKKyAgICAgICAgfQogCi0g
ICAgaWYgKGN1cnNvciAmJiBjdXJzb3ItPnBvc191cGRhdGVzKSB7Ci0gICAgICAgIGRweV9nbF9j
dXJzb3JfcG9zaXRpb24oZHB5LT5jb24sCi0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
Y3Vyc29yLT5wb3NfeCwKLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjdXJzb3ItPnBv
c195KTsKLSAgICAgICAgY3Vyc29yLT5wb3NfdXBkYXRlcyA9IDA7CisgICAgICAgIGlmIChjdXJz
b3IgJiYgY3Vyc29yLT5wb3NfdXBkYXRlcykgeworICAgICAgICAgICAgZHB5X2dsX2N1cnNvcl9w
b3NpdGlvbihkcHktPmNvbiwKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY3Vy
c29yLT5wb3NfeCwKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY3Vyc29yLT5w
b3NfeSk7CisgICAgICAgICAgICBjdXJzb3ItPnBvc191cGRhdGVzID0gMDsKKyAgICAgICAgfQog
ICAgIH0KIAogICAgIGRweV9nbF91cGRhdGUoZHB5LT5jb24sIDAsIDAsIHByaW1hcnktPmJ1Zi53
aWR0aCwgcHJpbWFyeS0+YnVmLmhlaWdodCk7CkBAIC0zNDAsNiArMzUwLDcgQEAgc3RhdGljIGNv
bnN0IEdyYXBoaWNId09wcyB2ZmlvX2Rpc3BsYXlfZG1hYnVmX29wcyA9IHsKICAgICAudWlfaW5m
byAgICA9IHZmaW9fZGlzcGxheV9lZGlkX3VpX2luZm8sCiB9OwogCitzdGF0aWMgaW50IHZmaW9f
cmVnaXN0ZXJfZGlzcGxheV9ub3RpZmllcihWRklPUENJRGV2aWNlICp2ZGV2KTsKIHN0YXRpYyBp
bnQgdmZpb19kaXNwbGF5X2RtYWJ1Zl9pbml0KFZGSU9QQ0lEZXZpY2UgKnZkZXYsIEVycm9yICoq
ZXJycCkKIHsKICAgICBpZiAoIWRpc3BsYXlfb3BlbmdsKSB7CkBAIC0zNTUsNiArMzY2LDggQEAg
c3RhdGljIGludCB2ZmlvX2Rpc3BsYXlfZG1hYnVmX2luaXQoVkZJT1BDSURldmljZSAqdmRldiwg
RXJyb3IgKiplcnJwKQogICAgICAgICB2ZGV2LT5kcHktPnJhbWZiID0gcmFtZmJfc2V0dXAoREVW
SUNFKHZkZXYpLCBlcnJwKTsKICAgICB9CiAgICAgdmZpb19kaXNwbGF5X2VkaWRfaW5pdCh2ZGV2
KTsKKyAgICB2ZmlvX3JlZ2lzdGVyX2Rpc3BsYXlfbm90aWZpZXIodmRldik7CisKICAgICByZXR1
cm4gMDsKIH0KIApAQCAtNDk1LDYgKzUwOCwxNzcgQEAgc3RhdGljIHZvaWQgdmZpb19kaXNwbGF5
X3JlZ2lvbl9leGl0KFZGSU9EaXNwbGF5ICpkcHkpCiAKIC8qIC0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0gKi8KIAor
c3RhdGljIHZvaWQgcHJpbWFyeV9wbGFuZV91cGRhdGUodm9pZCAqb3BhcXVlKQoreworICAgIFZG
SU9QQ0lEZXZpY2UgKnZkZXYgPSBvcGFxdWU7CisgICAgVkZJT0Rpc3BsYXkgKmRweSA9IHZkZXYt
PmRweTsKKworICAgIGlmICghZXZlbnRfbm90aWZpZXJfdGVzdF9hbmRfY2xlYXIoJmRweS0+cHJp
X2V2ZW50X25vdGlmaWVyKSkgeworICAgICAgICByZXR1cm47CisgICAgfQorCisgICAgZHB5LT5l
dmVudF9mbGFncyB8PSBWRklPX0lSUV9FVkVOVF9QUklNUkFZX1BMQU5FX0ZMSVA7CisgICAgZ3Jh
cGhpY19od19yZWZyZXNoKGRweS0+Y29uKTsKKyAgICBkcHktPmV2ZW50X2ZsYWdzICY9IH5WRklP
X0lSUV9FVkVOVF9QUklNUkFZX1BMQU5FX0ZMSVA7Cit9CisKK3N0YXRpYyB2b2lkIGN1cnNvcl9w
bGFuZV91cGRhdGUodm9pZCAqb3BhcXVlKQoreworICAgIFZGSU9QQ0lEZXZpY2UgKnZkZXYgPSBv
cGFxdWU7CisgICAgVkZJT0Rpc3BsYXkgKmRweSA9IHZkZXYtPmRweTsKKyAgICBzdGF0aWMgaW50
IHRpbWVzOworCisgICAgaWYgKCFldmVudF9ub3RpZmllcl90ZXN0X2FuZF9jbGVhcigmZHB5LT5j
dXJfZXZlbnRfbm90aWZpZXIpKSB7CisgICAgICAgIHJldHVybjsKKyAgICB9CisKKyAgICAvKiBI
YXZlIHRvIHNraXAgc29tZSBjdXJzb3IgZXZlbnRzIGR1ZSB0byBwZXJmb3JtYW5jZSBpbXBhY3Qg
Ki8KKyAgICBpZiAodGltZXMrKyAvIDIpIHsKKyAgICAgICAgdGltZXMgPSAwOworICAgICAgICBk
cHktPmV2ZW50X2ZsYWdzIHw9IFZGSU9fSVJRX0VWRU5UX0NVUlNPUl9QTEFORV9GTElQOworICAg
ICAgICBncmFwaGljX2h3X3JlZnJlc2goZHB5LT5jb24pOworICAgICAgICBkcHktPmV2ZW50X2Zs
YWdzICY9IH5WRklPX0lSUV9FVkVOVF9DVVJTT1JfUExBTkVfRkxJUDsKKyAgICB9Cit9CisKK3N0
YXRpYyBpbnQgcmVnaXN0ZXJfZGlzcGxheV9ub3RpZmllcihWRklPUENJRGV2aWNlICp2ZGV2LAor
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVpbnQzMl90IHR5cGUsIHVpbnQz
Ml90IHN1YnR5cGUsCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgRXZlbnRO
b3RpZmllciAqbm90aWZpZXIsCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
dm9pZCAoKmhhbmRsZXIpKHZvaWQgKm9wYXF1ZSkpCit7CisgICAgc3RydWN0IHZmaW9faXJxX2lu
Zm8gKmlycTsKKyAgICBzdHJ1Y3QgdmZpb19pcnFfc2V0ICppcnFfc2V0OworICAgIGludCBhcmdz
ejsKKyAgICBpbnQzMl90ICpwZmQ7CisgICAgaW50IHJldDsKKworICAgIHJldCA9IHZmaW9fZ2V0
X2Rldl9pcnFfaW5mbygmdmRldi0+dmJhc2VkZXYsCisgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHR5cGUsCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN1YnR5cGUsCisg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICZpcnEpOworICAgIGlmIChyZXQpIHsKKyAg
ICAgICAgZ290byBvdXQ7CisgICAgfQorCisgICAgcmV0ID0gZXZlbnRfbm90aWZpZXJfaW5pdChu
b3RpZmllciwgMCk7CisgICAgaWYgKHJldCkgeworICAgICAgICBlcnJvcl9yZXBvcnQoInZmaW86
IFVuYWJsZSB0byBpbml0IGV2ZW50IG5vdGlmaWVyIGZvciBkZXZpY2UgcmVxdWVzdCIpOworICAg
ICAgICBnb3RvIG91dDsKKyAgICB9CisKKyAgICBhcmdzeiA9IHNpemVvZigqaXJxX3NldCkgKyBz
aXplb2YoKnBmZCk7CisKKyAgICBpcnFfc2V0ID0gZ19tYWxsb2MwKGFyZ3N6KTsKKyAgICBpcnFf
c2V0LT5hcmdzeiA9IGFyZ3N6OworICAgIGlycV9zZXQtPmZsYWdzID0gVkZJT19JUlFfU0VUX0RB
VEFfRVZFTlRGRCB8CisgICAgICAgICAgICAgICAgICAgICBWRklPX0lSUV9TRVRfQUNUSU9OX1RS
SUdHRVI7CisgICAgaXJxX3NldC0+aW5kZXggPSBpcnEtPmluZGV4OworICAgIGlycV9zZXQtPnN0
YXJ0ID0gMDsKKyAgICBpcnFfc2V0LT5jb3VudCA9IDE7CisgICAgcGZkID0gKGludDMyX3QgKikm
aXJxX3NldC0+ZGF0YTsKKworICAgICpwZmQgPSBldmVudF9ub3RpZmllcl9nZXRfZmQobm90aWZp
ZXIpOworICAgIHFlbXVfc2V0X2ZkX2hhbmRsZXIoKnBmZCwgaGFuZGxlciwgTlVMTCwgdmRldik7
CisKKyAgICByZXQgPSBpb2N0bCh2ZGV2LT52YmFzZWRldi5mZCwgVkZJT19ERVZJQ0VfU0VUX0lS
UVMsIGlycV9zZXQpOworICAgIGlmIChyZXQpIHsKKyAgICAgICAgZXJyb3JfcmVwb3J0KCJ2Zmlv
OiBGYWlsZWQgdG8gc2V0IHVwIGRldmljZSByZXF1ZXN0IG5vdGlmaWNhdGlvbiIpOworICAgICAg
ICBxZW11X3NldF9mZF9oYW5kbGVyKCpwZmQsIE5VTEwsIE5VTEwsIHZkZXYpOworICAgICAgICBl
dmVudF9ub3RpZmllcl9jbGVhbnVwKG5vdGlmaWVyKTsKKyAgICB9CisKKyAgICBnX2ZyZWUoaXJx
X3NldCk7CisKK291dDoKKyAgICByZXR1cm4gcmV0OworfQorCitzdGF0aWMgaW50IHZmaW9fcmVn
aXN0ZXJfZGlzcGxheV9ub3RpZmllcihWRklPUENJRGV2aWNlICp2ZGV2KQoreworICAgIFZGSU9E
aXNwbGF5ICpkcHkgPSB2ZGV2LT5kcHk7CisgICAgaW50IHJldDsKKworICAgIHJldCA9IHJlZ2lz
dGVyX2Rpc3BsYXlfbm90aWZpZXIodmRldiwgVkZJT19JUlFfVFlQRV9HRlgsCisgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBWRklPX0lSUV9TVUJUWVBFX0dGWF9QUklfUExBTkVf
RkxJUCwKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICZkcHktPnByaV9ldmVu
dF9ub3RpZmllciwKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHByaW1hcnlf
cGxhbmVfdXBkYXRlKTsKKworICAgIGlmIChyZXQpIHsKKyAgICAgICAgZ290byBvdXQ7CisgICAg
fQorCisgICAgcmV0ID0gcmVnaXN0ZXJfZGlzcGxheV9ub3RpZmllcih2ZGV2LCBWRklPX0lSUV9U
WVBFX0dGWCwKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgVkZJT19JUlFfU1VC
VFlQRV9HRlhfQ1VSX1BMQU5FX0ZMSVAsCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICZkcHktPmN1cl9ldmVudF9ub3RpZmllciwKKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgY3Vyc29yX3BsYW5lX3VwZGF0ZSk7CitvdXQ6CisgICAgaWYgKHJldCkgeworICAg
ICAgICBkcHktPmV2ZW50X2ZsYWdzID0gMDsKKyAgICB9IGVsc2UgeworICAgICAgICBkcHktPmV2
ZW50X2ZsYWdzID0gVkZJT19JUlFfRVZFTlRfRU5BQkxFOworICAgIH0KKworICAgIHJldHVybiBy
ZXQ7Cit9CisKK3N0YXRpYyB2b2lkIHVucmVnaXN0ZXJfZGlzcGxheV9ub3RpZmllcihWRklPUENJ
RGV2aWNlICp2ZGV2LAorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdWlu
dDMyX3QgdHlwZSwgdWludDMyX3Qgc3VidHlwZSwKKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIEV2ZW50Tm90aWZpZXIgKm5vdGlmaWVyKQoreworICAgIFZGSU9EaXNwbGF5
ICpkcHkgPSB2ZGV2LT5kcHk7CisgICAgaW50IGFyZ3N6OworICAgIHN0cnVjdCB2ZmlvX2lycV9p
bmZvICppcnE7CisgICAgc3RydWN0IHZmaW9faXJxX3NldCAqaXJxX3NldDsKKyAgICBpbnQzMl90
ICpwZmQ7CisgICAgaW50IHJldDsKKworICAgIGlmICghZHB5LT5ldmVudF9mbGFncykgeworICAg
ICAgICByZXR1cm47CisgICAgfQorCisgICAgcmV0ID0gdmZpb19nZXRfZGV2X2lycV9pbmZvKCZ2
ZGV2LT52YmFzZWRldiwKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdHlwZSwKKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3VidHlwZSwKKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgJmlycSk7CisgICAgaWYgKHJldCkgeworICAgICAgICByZXR1cm4gOwor
ICAgIH0KKworICAgIGFyZ3N6ID0gc2l6ZW9mKCppcnFfc2V0KSArIHNpemVvZigqcGZkKTsKKwor
ICAgIGlycV9zZXQgPSBnX21hbGxvYzAoYXJnc3opOworICAgIGlycV9zZXQtPmFyZ3N6ID0gYXJn
c3o7CisgICAgaXJxX3NldC0+ZmxhZ3MgPSBWRklPX0lSUV9TRVRfREFUQV9FVkVOVEZEIHwKKyAg
ICAgICAgICAgICAgICAgICAgIFZGSU9fSVJRX1NFVF9BQ1RJT05fVFJJR0dFUjsKKyAgICBpcnFf
c2V0LT5pbmRleCA9IGlycS0+aW5kZXg7CisgICAgaXJxX3NldC0+c3RhcnQgPSAwOworICAgIGly
cV9zZXQtPmNvdW50ID0gMTsKKyAgICBwZmQgPSAoaW50MzJfdCAqKSZpcnFfc2V0LT5kYXRhOwor
ICAgICpwZmQgPSAtMTsKKworICAgIGlmIChpb2N0bCh2ZGV2LT52YmFzZWRldi5mZCwgVkZJT19E
RVZJQ0VfU0VUX0lSUVMsIGlycV9zZXQpKSB7CisgICAgICAgIGVycm9yX3JlcG9ydCgidmZpbzog
RmFpbGVkIHRvIGRlLWFzc2lnbiBkZXZpY2UgcmVxdWVzdCBmZDogJW0iKTsKKyAgICB9CisgICAg
Z19mcmVlKGlycV9zZXQpOworICAgIHFlbXVfc2V0X2ZkX2hhbmRsZXIoZXZlbnRfbm90aWZpZXJf
Z2V0X2ZkKG5vdGlmaWVyKSwKKyAgICAgICAgICAgICAgICAgICAgICAgIE5VTEwsIE5VTEwsIHZk
ZXYpOworICAgIGV2ZW50X25vdGlmaWVyX2NsZWFudXAobm90aWZpZXIpOworfQorCitzdGF0aWMg
dm9pZCB2ZmlvX3VucmVnaXN0ZXJfZGlzcGxheV9ub3RpZmllcihWRklPUENJRGV2aWNlICp2ZGV2
KQoreworICAgIFZGSU9EaXNwbGF5ICpkcHkgPSB2ZGV2LT5kcHk7CisKKyAgICB1bnJlZ2lzdGVy
X2Rpc3BsYXlfbm90aWZpZXIodmRldiwgVkZJT19JUlFfVFlQRV9HRlgsCisgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIFZGSU9fSVJRX1NVQlRZUEVfR0ZYX1BSSV9QTEFORV9GTElQLAor
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAmZHB5LT5wcmlfZXZlbnRfbm90aWZpZXIp
OworCisgICAgdW5yZWdpc3Rlcl9kaXNwbGF5X25vdGlmaWVyKHZkZXYsIFZGSU9fSVJRX1RZUEVf
R0ZYLAorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBWRklPX0lSUV9TVUJUWVBFX0dG
WF9DVVJfUExBTkVfRkxJUCwKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgJmRweS0+
Y3VyX2V2ZW50X25vdGlmaWVyKTsKKyAgICBkcHktPmV2ZW50X2ZsYWdzID0gZmFsc2U7Cit9CisK
IGludCB2ZmlvX2Rpc3BsYXlfcHJvYmUoVkZJT1BDSURldmljZSAqdmRldiwgRXJyb3IgKiplcnJw
KQogewogICAgIHN0cnVjdCB2ZmlvX2RldmljZV9nZnhfcGxhbmVfaW5mbyBwcm9iZTsKQEAgLTUz
MSw2ICs3MTUsNyBAQCB2b2lkIHZmaW9fZGlzcGxheV9maW5hbGl6ZShWRklPUENJRGV2aWNlICp2
ZGV2KQogICAgICAgICByZXR1cm47CiAgICAgfQogCisgICAgdmZpb191bnJlZ2lzdGVyX2Rpc3Bs
YXlfbm90aWZpZXIodmRldik7CiAgICAgZ3JhcGhpY19jb25zb2xlX2Nsb3NlKHZkZXYtPmRweS0+
Y29uKTsKICAgICB2ZmlvX2Rpc3BsYXlfZG1hYnVmX2V4aXQodmRldi0+ZHB5KTsKICAgICB2Zmlv
X2Rpc3BsYXlfcmVnaW9uX2V4aXQodmRldi0+ZHB5KTsKZGlmZiAtLWdpdCBhL2luY2x1ZGUvaHcv
dmZpby92ZmlvLWNvbW1vbi5oIGIvaW5jbHVkZS9ody92ZmlvL3ZmaW8tY29tbW9uLmgKaW5kZXgg
NWNhYjZhMWI4MS4uYTNmMDNiMjBlOCAxMDA2NDQKLS0tIGEvaW5jbHVkZS9ody92ZmlvL3ZmaW8t
Y29tbW9uLmgKKysrIGIvaW5jbHVkZS9ody92ZmlvL3ZmaW8tY29tbW9uLmgKQEAgLTI3LDYgKzI3
LDcgQEAKICNpbmNsdWRlICJxZW11L25vdGlmeS5oIgogI2luY2x1ZGUgInVpL2NvbnNvbGUuaCIK
ICNpbmNsdWRlICJody9kaXNwbGF5L3JhbWZiLmgiCisjaW5jbHVkZSAicWVtdS9ldmVudF9ub3Rp
Zmllci5oIgogI2lmZGVmIENPTkZJR19MSU5VWAogI2luY2x1ZGUgPGxpbnV4L3ZmaW8uaD4KICNl
bmRpZgpAQCAtMTQ1LDYgKzE0NiwxMCBAQCB0eXBlZGVmIHN0cnVjdCBWRklPRE1BQnVmIHsKICAg
ICBRVEFJTFFfRU5UUlkoVkZJT0RNQUJ1ZikgbmV4dDsKIH0gVkZJT0RNQUJ1ZjsKIAorI2RlZmlu
ZSBWRklPX0lSUV9FVkVOVF9FTkFCTEUgICAgICAgICAgICAgICgxIDw8IDApCisjZGVmaW5lIFZG
SU9fSVJRX0VWRU5UX1BSSU1SQVlfUExBTkVfRkxJUCAgKDEgPDwgMSkKKyNkZWZpbmUgVkZJT19J
UlFfRVZFTlRfQ1VSU09SX1BMQU5FX0ZMSVAgICAoMSA8PCAyKQorCiB0eXBlZGVmIHN0cnVjdCBW
RklPRGlzcGxheSB7CiAgICAgUWVtdUNvbnNvbGUgKmNvbjsKICAgICBSQU1GQlN0YXRlICpyYW1m
YjsKQEAgLTE1Miw2ICsxNTcsOSBAQCB0eXBlZGVmIHN0cnVjdCBWRklPRGlzcGxheSB7CiAgICAg
c3RydWN0IHZmaW9fcmVnaW9uX2dmeF9lZGlkICplZGlkX3JlZ3M7CiAgICAgdWludDhfdCAqZWRp
ZF9ibG9iOwogICAgIFFFTVVUaW1lciAqZWRpZF9saW5rX3RpbWVyOworICAgIEV2ZW50Tm90aWZp
ZXIgcHJpX2V2ZW50X25vdGlmaWVyOworICAgIEV2ZW50Tm90aWZpZXIgY3VyX2V2ZW50X25vdGlm
aWVyOworICAgIHVpbnQzMl90IGV2ZW50X2ZsYWdzOwogICAgIHN0cnVjdCB7CiAgICAgICAgIFZG
SU9SZWdpb24gYnVmZmVyOwogICAgICAgICBEaXNwbGF5U3VyZmFjZSAqc3VyZmFjZTsKLS0gCjIu
MTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50
ZWwtZ3Z0LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1n
dnQtZGV2
