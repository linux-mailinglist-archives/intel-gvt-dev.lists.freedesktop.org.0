Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CC69343AA
	for <lists+intel-gvt-dev@lfdr.de>; Tue,  4 Jun 2019 12:04:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9FFB897CD;
	Tue,  4 Jun 2019 10:04:29 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7224897C5
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue,  4 Jun 2019 10:04:28 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 04 Jun 2019 03:04:28 -0700
X-ExtLoop1: 1
Received: from gvt.bj.intel.com ([10.238.158.187])
 by orsmga007.jf.intel.com with ESMTP; 04 Jun 2019 03:04:26 -0700
From: Tina Zhang <tina.zhang@intel.com>
To: intel-gvt-dev@lists.freedesktop.org,
	qemu-devel@nongnu.org
Subject: [RFC PATCH 1/3] vfio: Add a funtion to return a specific irq
 capabilities
Date: Tue,  4 Jun 2019 17:58:45 +0800
Message-Id: <20190604095847.10532-2-tina.zhang@intel.com>
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

dmZpb19nZXRfZGV2X2lycV9pbmZvIGlzIGludHJvZHVjZWQgdG8gcmV0dXJuIGEgc3BlY2lmaWMg
aXJxCmNhcGFiaWxpdGllcy4KClNpZ25lZC1vZmYtYnk6IFRpbmEgWmhhbmcgPHRpbmEuemhhbmdA
aW50ZWwuY29tPgotLS0KIGh3L3ZmaW8vY29tbW9uLmMgICAgICAgICAgICAgIHwgNzggKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysKIGluY2x1ZGUvaHcvdmZpby92ZmlvLWNvbW1v
bi5oIHwgIDMgKysKIDIgZmlsZXMgY2hhbmdlZCwgODEgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdp
dCBhL2h3L3ZmaW8vY29tbW9uLmMgYi9ody92ZmlvL2NvbW1vbi5jCmluZGV4IDQzNzRjYzYxNzYu
LjkyOGVhNTQ0MTEgMTAwNjQ0Ci0tLSBhL2h3L3ZmaW8vY29tbW9uLmMKKysrIGIvaHcvdmZpby9j
b21tb24uYwpAQCAtNzQ4LDYgKzc0OCwyNSBAQCB2ZmlvX2dldF9yZWdpb25faW5mb19jYXAoc3Ry
dWN0IHZmaW9fcmVnaW9uX2luZm8gKmluZm8sIHVpbnQxNl90IGlkKQogICAgIHJldHVybiBOVUxM
OwogfQogCitzdGF0aWMgc3RydWN0IHZmaW9faW5mb19jYXBfaGVhZGVyICoKK3ZmaW9fZ2V0X2ly
cV9pbmZvX2NhcChzdHJ1Y3QgdmZpb19pcnFfaW5mbyAqaW5mbywgdWludDE2X3QgaWQpCit7Cisg
ICAgc3RydWN0IHZmaW9faW5mb19jYXBfaGVhZGVyICpoZHI7CisgICAgdm9pZCAqcHRyID0gaW5m
bzsKKworICAgIGlmICghKGluZm8tPmZsYWdzICYgVkZJT19JUlFfSU5GT19GTEFHX0NBUFMpKSB7
CisgICAgICAgIHJldHVybiBOVUxMOworICAgIH0KKworICAgIGZvciAoaGRyID0gcHRyICsgaW5m
by0+Y2FwX29mZnNldDsgaGRyICE9IHB0cjsgaGRyID0gcHRyICsgaGRyLT5uZXh0KSB7CisgICAg
ICAgIGlmIChoZHItPmlkID09IGlkKSB7CisgICAgICAgICAgICByZXR1cm4gaGRyOworICAgICAg
ICB9CisgICAgfQorCisgICAgcmV0dXJuIE5VTEw7Cit9CisKIHN0YXRpYyBpbnQgdmZpb19zZXR1
cF9yZWdpb25fc3BhcnNlX21tYXBzKFZGSU9SZWdpb24gKnJlZ2lvbiwKICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCB2ZmlvX3JlZ2lvbl9pbmZvICppbmZv
KQogewpAQCAtMTUzOSw2ICsxNTU4LDMzIEBAIHJldHJ5OgogICAgIHJldHVybiAwOwogfQogCitz
dGF0aWMgaW50IHZmaW9fZ2V0X2lycV9pbmZvKFZGSU9EZXZpY2UgKnZiYXNlZGV2LCBpbnQgaW5k
ZXgsCisgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IHZmaW9faXJxX2luZm8gKippbmZv
KQoreworICAgIHNpemVfdCBhcmdzeiA9IHNpemVvZihzdHJ1Y3QgdmZpb19pcnFfaW5mbyk7CisK
KyAgICAqaW5mbyA9IGdfbWFsbG9jMChhcmdzeik7CisKKyAgICAoKmluZm8pLT5pbmRleCA9IGlu
ZGV4OworcmV0cnk6CisgICAgKCppbmZvKS0+YXJnc3ogPSBhcmdzejsKKworICAgIGlmIChpb2N0
bCh2YmFzZWRldi0+ZmQsIFZGSU9fREVWSUNFX0dFVF9JUlFfSU5GTywgKmluZm8pKSB7CisgICAg
ICAgIGdfZnJlZSgqaW5mbyk7CisgICAgICAgICppbmZvID0gTlVMTDsKKyAgICAgICAgcmV0dXJu
IC1lcnJubzsKKyAgICB9CisKKyAgICBpZiAoKCppbmZvKS0+YXJnc3ogPiBhcmdzeikgeworICAg
ICAgICBhcmdzeiA9ICgqaW5mbyktPmFyZ3N6OworICAgICAgICAqaW5mbyA9IGdfcmVhbGxvYygq
aW5mbywgYXJnc3opOworCisgICAgICAgIGdvdG8gcmV0cnk7CisgICAgfQorCisgICAgcmV0dXJu
IDA7Cit9CisKIGludCB2ZmlvX2dldF9kZXZfcmVnaW9uX2luZm8oVkZJT0RldmljZSAqdmJhc2Vk
ZXYsIHVpbnQzMl90IHR5cGUsCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVpbnQzMl90
IHN1YnR5cGUsIHN0cnVjdCB2ZmlvX3JlZ2lvbl9pbmZvICoqaW5mbykKIHsKQEAgLTE1NzQsNiAr
MTYyMCwzOCBAQCBpbnQgdmZpb19nZXRfZGV2X3JlZ2lvbl9pbmZvKFZGSU9EZXZpY2UgKnZiYXNl
ZGV2LCB1aW50MzJfdCB0eXBlLAogICAgIHJldHVybiAtRU5PREVWOwogfQogCitpbnQgdmZpb19n
ZXRfZGV2X2lycV9pbmZvKFZGSU9EZXZpY2UgKnZiYXNlZGV2LCB1aW50MzJfdCB0eXBlLAorICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICB1aW50MzJfdCBzdWJ0eXBlLCBzdHJ1Y3QgdmZpb19p
cnFfaW5mbyAqKmluZm8pCit7CisgICAgaW50IGk7CisKKyAgICBmb3IgKGkgPSAwOyBpIDwgdmJh
c2VkZXYtPm51bV9pcnFzOyBpKyspIHsKKyAgICAgICAgc3RydWN0IHZmaW9faW5mb19jYXBfaGVh
ZGVyICpoZHI7CisgICAgICAgIHN0cnVjdCB2ZmlvX2lycV9pbmZvX2NhcF90eXBlICpjYXBfdHlw
ZTsKKworICAgICAgICBpZiAodmZpb19nZXRfaXJxX2luZm8odmJhc2VkZXYsIGksIGluZm8pKSB7
CisgICAgICAgICAgICBjb250aW51ZTsKKyAgICAgICAgfQorCisgICAgICAgIGhkciA9IHZmaW9f
Z2V0X2lycV9pbmZvX2NhcCgqaW5mbywgVkZJT19JUlFfSU5GT19DQVBfVFlQRSk7CisgICAgICAg
IGlmICghaGRyKSB7CisgICAgICAgICAgICBnX2ZyZWUoKmluZm8pOworICAgICAgICAgICAgY29u
dGludWU7CisgICAgICAgIH0KKworICAgICAgICBjYXBfdHlwZSA9IGNvbnRhaW5lcl9vZihoZHIs
IHN0cnVjdCB2ZmlvX2lycV9pbmZvX2NhcF90eXBlLCBoZWFkZXIpOworCisgICAgICAgIGlmIChj
YXBfdHlwZS0+dHlwZSA9PSB0eXBlICYmIGNhcF90eXBlLT5zdWJ0eXBlID09IHN1YnR5cGUpIHsK
KyAgICAgICAgICAgIHJldHVybiAwOworICAgICAgICB9CisKKyAgICAgICAgZ19mcmVlKCppbmZv
KTsKKyAgICB9CisKKyAgICAqaW5mbyA9IE5VTEw7CisgICAgcmV0dXJuIC1FTk9ERVY7Cit9CisK
IGJvb2wgdmZpb19oYXNfcmVnaW9uX2NhcChWRklPRGV2aWNlICp2YmFzZWRldiwgaW50IHJlZ2lv
biwgdWludDE2X3QgY2FwX3R5cGUpCiB7CiAgICAgc3RydWN0IHZmaW9fcmVnaW9uX2luZm8gKmlu
Zm8gPSBOVUxMOwpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9ody92ZmlvL3ZmaW8tY29tbW9uLmggYi9p
bmNsdWRlL2h3L3ZmaW8vdmZpby1jb21tb24uaAppbmRleCAxMTU1Yjc5Njc4Li41Y2FiNmExYjgx
IDEwMDY0NAotLS0gYS9pbmNsdWRlL2h3L3ZmaW8vdmZpby1jb21tb24uaAorKysgYi9pbmNsdWRl
L2h3L3ZmaW8vdmZpby1jb21tb24uaApAQCAtMTk1LDYgKzE5NSw5IEBAIGludCB2ZmlvX2dldF9k
ZXZfcmVnaW9uX2luZm8oVkZJT0RldmljZSAqdmJhc2VkZXYsIHVpbnQzMl90IHR5cGUsCiBib29s
IHZmaW9faGFzX3JlZ2lvbl9jYXAoVkZJT0RldmljZSAqdmJhc2VkZXYsIGludCByZWdpb24sIHVp
bnQxNl90IGNhcF90eXBlKTsKIHN0cnVjdCB2ZmlvX2luZm9fY2FwX2hlYWRlciAqCiB2ZmlvX2dl
dF9yZWdpb25faW5mb19jYXAoc3RydWN0IHZmaW9fcmVnaW9uX2luZm8gKmluZm8sIHVpbnQxNl90
IGlkKTsKKworaW50IHZmaW9fZ2V0X2Rldl9pcnFfaW5mbyhWRklPRGV2aWNlICp2YmFzZWRldiwg
dWludDMyX3QgdHlwZSwKKyAgICAgICAgICAgICAgICAgICAgICAgICAgdWludDMyX3Qgc3VidHlw
ZSwgc3RydWN0IHZmaW9faXJxX2luZm8gKippbmZvKTsKICNlbmRpZgogZXh0ZXJuIGNvbnN0IE1l
bW9yeUxpc3RlbmVyIHZmaW9fcHJlcmVnX2xpc3RlbmVyOwogCi0tIAoyLjE3LjEKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmludGVsLWd2dC1kZXYgbWFp
bGluZyBsaXN0CmludGVsLWd2dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ3Z0LWRldg==
