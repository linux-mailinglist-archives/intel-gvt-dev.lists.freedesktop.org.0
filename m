Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C46335EB6D7
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 27 Sep 2022 03:31:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7405D10E888;
	Tue, 27 Sep 2022 01:31:09 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E55C110E885
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 27 Sep 2022 01:31:06 +0000 (UTC)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28R1EAVN007201;
 Tue, 27 Sep 2022 01:30:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : in-reply-to : references : content-type :
 content-transfer-encoding : date : mime-version; s=pp1;
 bh=Wd2bGeS0+ZtY38vTi0R5zxxAJdkSNMsQjdx4lcsWVqE=;
 b=DoA2vqxjavKq12eiuWO3SiTVWn+mEE94o1n5AD6hkhSyVAVy/a4GDpl+2nquxrvnN43c
 V+mg/4kPHsVO5ClqrvfxgPGYRqqVFfA9XyOD9t4jd8lOabqHUA3asC+0ZVhkdiFacJmd
 4jqn4rq6cs518s1xWWrialBIgSt29G4mJN+6QHNN1KBD8RJp+PYCXx4kddl1npXkb/WC
 7eUwtVVFuy8G4a2kRuUJs5H83aAI+xySUFDz+yvLBkJ6aeZuAv5MuOT0Lxeo0sHY457P
 u+q/eb5nnYQB9BOvKWDIz7R6aFFKH0kBMS48Wmm56F0JeMcYgDpSBJTBJQBA9C0Pl/HM 6A== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3juqax8ejr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 27 Sep 2022 01:30:58 +0000
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 28R1FKrt013663;
 Tue, 27 Sep 2022 01:30:57 GMT
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3juqax8ejg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 27 Sep 2022 01:30:57 +0000
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 28R1Krt8023073;
 Tue, 27 Sep 2022 01:30:57 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma03wdc.us.ibm.com with ESMTP id 3jssh99kqv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 27 Sep 2022 01:30:57 +0000
Received: from smtpav01.dal12v.mail.ibm.com ([9.208.128.133])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 28R1UuYp63701398
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 27 Sep 2022 01:30:56 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8B40258058;
 Tue, 27 Sep 2022 01:30:55 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3689958057;
 Tue, 27 Sep 2022 01:30:54 +0000 (GMT)
Received: from li-479af74c-31f9-11b2-a85c-e4ddee11713b.ibm.com (unknown
 [9.160.170.198])
 by smtpav01.dal12v.mail.ibm.com (Postfix) with ESMTP;
 Tue, 27 Sep 2022 01:30:54 +0000 (GMT)
Message-ID: <57a82a1840723a97e432a15b847e36e2e351bb94.camel@linux.ibm.com>
Subject: Re: [PATCH 10/14] vfio/mdev: consolidate all the device_api sysfs
 into the core code
From: Eric Farman <farman@linux.ibm.com>
To: Christoph Hellwig <hch@lst.de>, Kirti Wankhede <kwankhede@nvidia.com>,
 Tony Krowiak <akrowiak@linux.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>, Jason Herne <jjherne@linux.ibm.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>,
 Alex Williamson <alex.williamson@redhat.com>
In-Reply-To: <20220923092652.100656-11-hch@lst.de>
References: <20220923092652.100656-1-hch@lst.de>
 <20220923092652.100656-11-hch@lst.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Date: Mon, 26 Sep 2022 21:28:33 -0400
MIME-Version: 1.0
User-Agent: Evolution 3.44.4 (3.44.4-1.fc36) 
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: anvIW8APYJitKYuU7BC4QlD0Xek79C6Z
X-Proofpoint-ORIG-GUID: ONx6qF5Algrn9ISe6fSF3EfQyOBY5nc3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-26_11,2022-09-22_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0
 priorityscore=1501 suspectscore=0 mlxlogscore=999 mlxscore=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0
 malwarescore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2209130000 definitions=main-2209270005
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
Cc: linux-s390@vger.kernel.org, Kevin Tian <kevin.tian@intel.com>,
 intel-gvt-dev@lists.freedesktop.org, kvm@vger.kernel.org,
 Jason Gunthorpe <jgg@nvidia.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

T24gRnJpLCAyMDIyLTA5LTIzIGF0IDExOjI2ICswMjAwLCBDaHJpc3RvcGggSGVsbHdpZyB3cm90
ZToKPiBGcm9tOiBKYXNvbiBHdW50aG9ycGUgPGpnZ0BudmlkaWEuY29tPgo+IAo+IEV2ZXJ5IGRy
aXZlciBqdXN0IGVtaXRzIGEgc3RhdGljIHN0cmluZywgc2ltcGx5IGZlZWQgaXQgdGhyb3VnaCB0
aGUKPiBvcHMKPiBhbmQgcHJvdmlkZSBhIHN0YW5kYXJkIHN5c2ZzIHNob3cgZnVuY3Rpb24uCj4g
Cj4gU2lnbmVkLW9mZi1ieTogSmFzb24gR3VudGhvcnBlIDxqZ2dAbnZpZGlhLmNvbT4KPiBTaWdu
ZWQtb2ZmLWJ5OiBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGxzdC5kZT4KPiBSZXZpZXdlZC1ieTog
VG9ueSBLcm93aWFrIDxha3Jvd2lha0BsaW51eC5pYm0uY29tPgo+IFJldmlld2VkLWJ5OiBLZXZp
biBUaWFuIDxrZXZpbi50aWFuQGludGVsLmNvbT4KPiBSZXZpZXdlZC1ieTogS2lydGkgV2Fua2hl
ZGUgPGt3YW5raGVkZUBudmlkaWEuY29tPgoKUmV2aWV3ZWQtYnk6IEVyaWMgRmFybWFuIDxmYXJt
YW5AbGludXguaWJtLmNvbT4KCj4gLS0tCj4gwqAuLi4vZHJpdmVyLWFwaS92ZmlvLW1lZGlhdGVk
LWRldmljZS5yc3TCoMKgwqDCoMKgwqAgfMKgIDIgKy0KPiDCoGRyaXZlcnMvZ3B1L2RybS9pOTE1
L2d2dC9rdm1ndC5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgIDkgKy0tLS0KPiDCoGRy
aXZlcnMvczM5MC9jaW8vdmZpb19jY3dfb3BzLmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IHzCoCA5ICstLS0tCj4gwqBkcml2ZXJzL3MzOTAvY3J5cHRvL3ZmaW9fYXBfb3BzLmPCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgfCAxMCArLS0tLS0KPiDCoGRyaXZlcnMvdmZpby9tZGV2L21kZXZf
ZHJpdmVyLmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCA0ICsrLQo+IMKgZHJpdmVy
cy92ZmlvL21kZXYvbWRldl9zeXNmcy5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwg
MzUgKysrKysrKysrKysrKy0tLS0KPiAtLQo+IMKgaW5jbHVkZS9saW51eC9tZGV2LmjCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgNyArKy0tCj4g
wqBzYW1wbGVzL3ZmaW8tbWRldi9tYm9jaHMuY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIHzCoCA5ICstLS0tCj4gwqBzYW1wbGVzL3ZmaW8tbWRldi9tZHB5LmPCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgIDkgKy0tLS0KPiDCoHNhbXBs
ZXMvdmZpby1tZGV2L210dHkuY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCB8IDEwICstLS0tLQo+IMKgMTAgZmlsZXMgY2hhbmdlZCwgMzcgaW5zZXJ0aW9ucygrKSwg
NjcgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZHJpdmVyLWFw
aS92ZmlvLW1lZGlhdGVkLWRldmljZS5yc3QKPiBiL0RvY3VtZW50YXRpb24vZHJpdmVyLWFwaS92
ZmlvLW1lZGlhdGVkLWRldmljZS5yc3QKPiBpbmRleCA3YjY2MGYzZmEyYzkyLi5iMGMyOWUzN2Y2
MWI0IDEwMDY0NAo+IC0tLSBhL0RvY3VtZW50YXRpb24vZHJpdmVyLWFwaS92ZmlvLW1lZGlhdGVk
LWRldmljZS5yc3QKPiArKysgYi9Eb2N1bWVudGF0aW9uL2RyaXZlci1hcGkvdmZpby1tZWRpYXRl
ZC1kZXZpY2UucnN0Cj4gQEAgLTIwMiw3ICsyMDIsNyBAQCBEaXJlY3RvcmllcyBhbmQgZmlsZXMg
dW5kZXIgdGhlIHN5c2ZzIGZvciBFYWNoCj4gUGh5c2ljYWwgRGV2aWNlCj4gwqAKPiDCoCogZGV2
aWNlX2FwaQo+IMKgCj4gLcKgIFRoaXMgYXR0cmlidXRlIHNob3VsZCBzaG93IHdoaWNoIGRldmlj
ZSBBUEkgaXMgYmVpbmcgY3JlYXRlZCwgZm9yCj4gZXhhbXBsZSwKPiArwqAgVGhpcyBhdHRyaWJ1
dGUgc2hvd3Mgd2hpY2ggZGV2aWNlIEFQSSBpcyBiZWluZyBjcmVhdGVkLCBmb3IKPiBleGFtcGxl
LAo+IMKgwqAgInZmaW8tcGNpIiBmb3IgYSBQQ0kgZGV2aWNlLgo+IMKgCj4gwqAqIGF2YWlsYWJs
ZV9pbnN0YW5jZXMKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2t2bWd0
LmMKPiBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9rdm1ndC5jCj4gaW5kZXggMTk0N2Y1NTNm
Y2QzOC4uOWIyZDNiMDc4YTJjOSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9n
dnQva3ZtZ3QuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9rdm1ndC5jCj4gQEAg
LTEyMywxMiArMTIzLDYgQEAgc3RhdGljIHNzaXplX3QgYXZhaWxhYmxlX2luc3RhbmNlc19zaG93
KHN0cnVjdAo+IG1kZXZfdHlwZSAqbXR5cGUsCj4gwqDCoMKgwqDCoMKgwqDCoHJldHVybiBzcHJp
bnRmKGJ1ZiwgIiV1XG4iLCB0eXBlLT5hdmFpbF9pbnN0YW5jZSk7Cj4gwqB9Cj4gwqAKPiAtc3Rh
dGljIHNzaXplX3QgZGV2aWNlX2FwaV9zaG93KHN0cnVjdCBtZGV2X3R5cGUgKm10eXBlLAo+IC3C
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IHN0cnVjdCBtZGV2X3R5cGVfYXR0cmlidXRlICphdHRyLCBjaGFyCj4gKmJ1ZikKPiAtewo+IC3C
oMKgwqDCoMKgwqDCoHJldHVybiBzcHJpbnRmKGJ1ZiwgIiVzXG4iLCBWRklPX0RFVklDRV9BUElf
UENJX1NUUklORyk7Cj4gLX0KPiAtCj4gwqBzdGF0aWMgc3NpemVfdCBkZXNjcmlwdGlvbl9zaG93
KHN0cnVjdCBtZGV2X3R5cGUgKm10eXBlLAo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBzdHJ1Y3QgbWRldl90eXBlX2F0dHJp
YnV0ZSAqYXR0ciwKPiBjaGFyICpidWYpCj4gwqB7Cj4gQEAgLTE1MSwxMyArMTQ1LDExIEBAIHN0
YXRpYyBzc2l6ZV90IG5hbWVfc2hvdyhzdHJ1Y3QgbWRldl90eXBlCj4gKm10eXBlLAo+IMKgfQo+
IMKgCj4gwqBzdGF0aWMgTURFVl9UWVBFX0FUVFJfUk8oYXZhaWxhYmxlX2luc3RhbmNlcyk7Cj4g
LXN0YXRpYyBNREVWX1RZUEVfQVRUUl9STyhkZXZpY2VfYXBpKTsKPiDCoHN0YXRpYyBNREVWX1RZ
UEVfQVRUUl9STyhkZXNjcmlwdGlvbik7Cj4gwqBzdGF0aWMgTURFVl9UWVBFX0FUVFJfUk8obmFt
ZSk7Cj4gwqAKPiDCoHN0YXRpYyBjb25zdCBzdHJ1Y3QgYXR0cmlidXRlICpndnRfdHlwZV9hdHRy
c1tdID0gewo+IMKgwqDCoMKgwqDCoMKgwqAmbWRldl90eXBlX2F0dHJfYXZhaWxhYmxlX2luc3Rh
bmNlcy5hdHRyLAo+IC3CoMKgwqDCoMKgwqDCoCZtZGV2X3R5cGVfYXR0cl9kZXZpY2VfYXBpLmF0
dHIsCj4gwqDCoMKgwqDCoMKgwqDCoCZtZGV2X3R5cGVfYXR0cl9kZXNjcmlwdGlvbi5hdHRyLAo+
IMKgwqDCoMKgwqDCoMKgwqAmbWRldl90eXBlX2F0dHJfbmFtZS5hdHRyLAo+IMKgwqDCoMKgwqDC
oMKgwqBOVUxMLAo+IEBAIC0xNTQ5LDYgKzE1NDEsNyBAQCBzdGF0aWMgdm9pZCBpbnRlbF92Z3B1
X3JlbW92ZShzdHJ1Y3QKPiBtZGV2X2RldmljZSAqbWRldikKPiDCoH0KPiDCoAo+IMKgc3RhdGlj
IHN0cnVjdCBtZGV2X2RyaXZlciBpbnRlbF92Z3B1X21kZXZfZHJpdmVyID0gewo+ICvCoMKgwqDC
oMKgwqDCoC5kZXZpY2VfYXBpwqDCoMKgwqDCoD0gVkZJT19ERVZJQ0VfQVBJX1BDSV9TVFJJTkcs
Cj4gwqDCoMKgwqDCoMKgwqDCoC5kcml2ZXIgPSB7Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAubmFtZcKgwqDCoMKgwqDCoMKgwqDCoMKgwqA9ICJpbnRlbF92Z3B1X21kZXYiLAo+
IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgLm93bmVywqDCoMKgwqDCoMKgwqDCoMKg
wqA9IFRISVNfTU9EVUxFLAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3MzOTAvY2lvL3ZmaW9fY2N3
X29wcy5jCj4gYi9kcml2ZXJzL3MzOTAvY2lvL3ZmaW9fY2N3X29wcy5jCj4gaW5kZXggM2RiNjI1
MWIzMTE0My4uNGM3YjE4MTUxOTIyOCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3MzOTAvY2lvL3Zm
aW9fY2N3X29wcy5jCj4gKysrIGIvZHJpdmVycy9zMzkwL2Npby92ZmlvX2Njd19vcHMuYwo+IEBA
IC01MSwxMyArNTEsNiBAQCBzdGF0aWMgc3NpemVfdCBuYW1lX3Nob3coc3RydWN0IG1kZXZfdHlw
ZSAqbXR5cGUsCj4gwqB9Cj4gwqBzdGF0aWMgTURFVl9UWVBFX0FUVFJfUk8obmFtZSk7Cj4gwqAK
PiAtc3RhdGljIHNzaXplX3QgZGV2aWNlX2FwaV9zaG93KHN0cnVjdCBtZGV2X3R5cGUgKm10eXBl
LAo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIHN0cnVjdCBtZGV2X3R5cGVfYXR0cmlidXRlICphdHRyLCBjaGFyCj4gKmJ1ZikKPiAt
ewo+IC3CoMKgwqDCoMKgwqDCoHJldHVybiBzcHJpbnRmKGJ1ZiwgIiVzXG4iLCBWRklPX0RFVklD
RV9BUElfQ0NXX1NUUklORyk7Cj4gLX0KPiAtc3RhdGljIE1ERVZfVFlQRV9BVFRSX1JPKGRldmlj
ZV9hcGkpOwo+IC0KPiDCoHN0YXRpYyBzc2l6ZV90IGF2YWlsYWJsZV9pbnN0YW5jZXNfc2hvdyhz
dHJ1Y3QgbWRldl90eXBlICptdHlwZSwKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHN0cnVjdCBt
ZGV2X3R5cGVfYXR0cmlidXRlCj4gKmF0dHIsCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBjaGFy
ICpidWYpCj4gQEAgLTcwLDcgKzYzLDYgQEAgc3RhdGljIE1ERVZfVFlQRV9BVFRSX1JPKGF2YWls
YWJsZV9pbnN0YW5jZXMpOwo+IMKgCj4gwqBzdGF0aWMgY29uc3Qgc3RydWN0IGF0dHJpYnV0ZSAq
bWRldl90eXBlc19hdHRyc1tdID0gewo+IMKgwqDCoMKgwqDCoMKgwqAmbWRldl90eXBlX2F0dHJf
bmFtZS5hdHRyLAo+IC3CoMKgwqDCoMKgwqDCoCZtZGV2X3R5cGVfYXR0cl9kZXZpY2VfYXBpLmF0
dHIsCj4gwqDCoMKgwqDCoMKgwqDCoCZtZGV2X3R5cGVfYXR0cl9hdmFpbGFibGVfaW5zdGFuY2Vz
LmF0dHIsCj4gwqDCoMKgwqDCoMKgwqDCoE5VTEwsCj4gwqB9Owo+IEBAIC02MjgsNiArNjIwLDcg
QEAgc3RhdGljIGNvbnN0IHN0cnVjdCB2ZmlvX2RldmljZV9vcHMKPiB2ZmlvX2Njd19kZXZfb3Bz
ID0gewo+IMKgfTsKPiDCoAo+IMKgc3RydWN0IG1kZXZfZHJpdmVyIHZmaW9fY2N3X21kZXZfZHJp
dmVyID0gewo+ICvCoMKgwqDCoMKgwqDCoC5kZXZpY2VfYXBpID0gVkZJT19ERVZJQ0VfQVBJX0ND
V19TVFJJTkcsCj4gwqDCoMKgwqDCoMKgwqDCoC5kcml2ZXIgPSB7Cj4gwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAubmFtZSA9ICJ2ZmlvX2Njd19tZGV2IiwKPiDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoC5vd25lciA9IFRISVNfTU9EVUxFLAo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL3MzOTAvY3J5cHRvL3ZmaW9fYXBfb3BzLmMKPiBiL2RyaXZlcnMvczM5MC9jcnlwdG8v
dmZpb19hcF9vcHMuYwo+IGluZGV4IDI0ZDEzMWM1MDJjYTMuLmQ0NDBhY2ZiYjI2MWUgMTAwNjQ0
Cj4gLS0tIGEvZHJpdmVycy9zMzkwL2NyeXB0by92ZmlvX2FwX29wcy5jCj4gKysrIGIvZHJpdmVy
cy9zMzkwL2NyeXB0by92ZmlvX2FwX29wcy5jCj4gQEAgLTgwOCwxNyArODA4LDggQEAgc3RhdGlj
IHNzaXplX3QgYXZhaWxhYmxlX2luc3RhbmNlc19zaG93KHN0cnVjdAo+IG1kZXZfdHlwZSAqbXR5
cGUsCj4gwqAKPiDCoHN0YXRpYyBNREVWX1RZUEVfQVRUUl9STyhhdmFpbGFibGVfaW5zdGFuY2Vz
KTsKPiDCoAo+IC1zdGF0aWMgc3NpemVfdCBkZXZpY2VfYXBpX3Nob3coc3RydWN0IG1kZXZfdHlw
ZSAqbXR5cGUsCj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgc3RydWN0IG1kZXZfdHlwZV9hdHRyaWJ1dGUgKmF0dHIsIGNoYXIKPiAq
YnVmKQo+IC17Cj4gLcKgwqDCoMKgwqDCoMKgcmV0dXJuIHNwcmludGYoYnVmLCAiJXNcbiIsIFZG
SU9fREVWSUNFX0FQSV9BUF9TVFJJTkcpOwo+IC19Cj4gLQo+IC1zdGF0aWMgTURFVl9UWVBFX0FU
VFJfUk8oZGV2aWNlX2FwaSk7Cj4gLQo+IMKgc3RhdGljIGNvbnN0IHN0cnVjdCBhdHRyaWJ1dGUg
KnZmaW9fYXBfbWRldl90eXBlX2F0dHJzW10gPSB7Cj4gwqDCoMKgwqDCoMKgwqDCoCZtZGV2X3R5
cGVfYXR0cl9uYW1lLmF0dHIsCj4gLcKgwqDCoMKgwqDCoMKgJm1kZXZfdHlwZV9hdHRyX2Rldmlj
ZV9hcGkuYXR0ciwKPiDCoMKgwqDCoMKgwqDCoMKgJm1kZXZfdHlwZV9hdHRyX2F2YWlsYWJsZV9p
bnN0YW5jZXMuYXR0ciwKPiDCoMKgwqDCoMKgwqDCoMKgTlVMTCwKPiDCoH07Cj4gQEAgLTE3OTks
NiArMTc5MCw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgdmZpb19kZXZpY2Vfb3BzCj4gdmZpb19h
cF9tYXRyaXhfZGV2X29wcyA9IHsKPiDCoH07Cj4gwqAKPiDCoHN0YXRpYyBzdHJ1Y3QgbWRldl9k
cml2ZXIgdmZpb19hcF9tYXRyaXhfZHJpdmVyID0gewo+ICvCoMKgwqDCoMKgwqDCoC5kZXZpY2Vf
YXBpID0gVkZJT19ERVZJQ0VfQVBJX0FQX1NUUklORywKPiDCoMKgwqDCoMKgwqDCoMKgLmRyaXZl
ciA9IHsKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoC5uYW1lID0gInZmaW9fYXBf
bWRldiIsCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAub3duZXIgPSBUSElTX01P
RFVMRSwKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy92ZmlvL21kZXYvbWRldl9kcml2ZXIuYwo+IGIv
ZHJpdmVycy92ZmlvL21kZXYvbWRldl9kcml2ZXIuYwo+IGluZGV4IDViM2M5NGY0ZmIxM2QuLjYw
ZThiOWY2NDc0ZTggMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy92ZmlvL21kZXYvbWRldl9kcml2ZXIu
Ywo+ICsrKyBiL2RyaXZlcnMvdmZpby9tZGV2L21kZXZfZHJpdmVyLmMKPiBAQCAtNTUsOCArNTUs
MTAgQEAgc3RydWN0IGJ1c190eXBlIG1kZXZfYnVzX3R5cGUgPSB7Cj4gwqAgKiovCj4gwqBpbnQg
bWRldl9yZWdpc3Rlcl9kcml2ZXIoc3RydWN0IG1kZXZfZHJpdmVyICpkcnYpCj4gwqB7Cj4gLcKg
wqDCoMKgwqDCoMKgaWYgKCFkcnYtPnR5cGVzX2F0dHJzKQo+ICvCoMKgwqDCoMKgwqDCoGlmICgh
ZHJ2LT50eXBlc19hdHRycyB8fCAhZHJ2LT5kZXZpY2VfYXBpKQo+IMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgcmV0dXJuIC1FSU5WQUw7Cj4gKwo+ICvCoMKgwqDCoMKgwqDCoC8qIGlu
aXRpYWxpemUgY29tbW9uIGRyaXZlciBmaWVsZHMgKi8KPiDCoMKgwqDCoMKgwqDCoMKgZHJ2LT5k
cml2ZXIuYnVzID0gJm1kZXZfYnVzX3R5cGU7Cj4gwqDCoMKgwqDCoMKgwqDCoHJldHVybiBkcml2
ZXJfcmVnaXN0ZXIoJmRydi0+ZHJpdmVyKTsKPiDCoH0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy92
ZmlvL21kZXYvbWRldl9zeXNmcy5jCj4gYi9kcml2ZXJzL3ZmaW8vbWRldi9tZGV2X3N5c2ZzLmMK
PiBpbmRleCAzOGI0YzI0NjZlYzQzLi42MGZjNTJmZjkyNDQ4IDEwMDY0NAo+IC0tLSBhL2RyaXZl
cnMvdmZpby9tZGV2L21kZXZfc3lzZnMuYwo+ICsrKyBiL2RyaXZlcnMvdmZpby9tZGV2L21kZXZf
c3lzZnMuYwo+IEBAIC03Miw5ICs3MiwzMCBAQCBzdGF0aWMgc3NpemVfdCBjcmVhdGVfc3RvcmUo
c3RydWN0IG1kZXZfdHlwZQo+ICptdHlwZSwKPiDCoAo+IMKgwqDCoMKgwqDCoMKgwqByZXR1cm4g
Y291bnQ7Cj4gwqB9Cj4gLQo+IMKgc3RhdGljIE1ERVZfVFlQRV9BVFRSX1dPKGNyZWF0ZSk7Cj4g
wqAKPiArc3RhdGljIHNzaXplX3QgZGV2aWNlX2FwaV9zaG93KHN0cnVjdCBtZGV2X3R5cGUgKm10
eXBlLAo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIHN0cnVjdCBtZGV2X3R5cGVfYXR0cmlidXRlICphdHRyLCBjaGFyCj4gKmJ1ZikK
PiArewo+ICvCoMKgwqDCoMKgwqDCoHJldHVybiBzeXNmc19lbWl0KGJ1ZiwgIiVzXG4iLCBtdHlw
ZS0+cGFyZW50LT5tZGV2X2RyaXZlci0KPiA+ZGV2aWNlX2FwaSk7Cj4gK30KPiArc3RhdGljIE1E
RVZfVFlQRV9BVFRSX1JPKGRldmljZV9hcGkpOwo+ICsKPiArc3RhdGljIHN0cnVjdCBhdHRyaWJ1
dGUgKm1kZXZfdHlwZXNfY29yZV9hdHRyc1tdID0gewo+ICvCoMKgwqDCoMKgwqDCoCZtZGV2X3R5
cGVfYXR0cl9jcmVhdGUuYXR0ciwKPiArwqDCoMKgwqDCoMKgwqAmbWRldl90eXBlX2F0dHJfZGV2
aWNlX2FwaS5hdHRyLAo+ICvCoMKgwqDCoMKgwqDCoE5VTEwsCj4gK307Cj4gKwo+ICtzdGF0aWMg
c3RydWN0IGF0dHJpYnV0ZV9ncm91cCBtZGV2X3R5cGVfY29yZV9ncm91cCA9IHsKPiArwqDCoMKg
wqDCoMKgwqAuYXR0cnMgPSBtZGV2X3R5cGVzX2NvcmVfYXR0cnMsCj4gK307Cj4gKwo+ICtzdGF0
aWMgY29uc3Qgc3RydWN0IGF0dHJpYnV0ZV9ncm91cCAqbWRldl90eXBlX2dyb3Vwc1tdID0gewo+
ICvCoMKgwqDCoMKgwqDCoCZtZGV2X3R5cGVfY29yZV9ncm91cCwKPiArwqDCoMKgwqDCoMKgwqBO
VUxMLAo+ICt9Owo+ICsKPiDCoHN0YXRpYyB2b2lkIG1kZXZfdHlwZV9yZWxlYXNlKHN0cnVjdCBr
b2JqZWN0ICprb2JqKQo+IMKgewo+IMKgwqDCoMKgwqDCoMKgwqBzdHJ1Y3QgbWRldl90eXBlICp0
eXBlID0gdG9fbWRldl90eXBlKGtvYmopOwo+IEBAIC04NSw4ICsxMDYsOSBAQCBzdGF0aWMgdm9p
ZCBtZGV2X3R5cGVfcmVsZWFzZShzdHJ1Y3Qga29iamVjdAo+ICprb2JqKQo+IMKgfQo+IMKgCj4g
wqBzdGF0aWMgc3RydWN0IGtvYmpfdHlwZSBtZGV2X3R5cGVfa3R5cGUgPSB7Cj4gLcKgwqDCoMKg
wqDCoMKgLnN5c2ZzX29wcyA9ICZtZGV2X3R5cGVfc3lzZnNfb3BzLAo+IC3CoMKgwqDCoMKgwqDC
oC5yZWxlYXNlID0gbWRldl90eXBlX3JlbGVhc2UsCj4gK8KgwqDCoMKgwqDCoMKgLnN5c2ZzX29w
c8KgwqDCoMKgwqDCoD0gJm1kZXZfdHlwZV9zeXNmc19vcHMsCj4gK8KgwqDCoMKgwqDCoMKgLnJl
bGVhc2XCoMKgwqDCoMKgwqDCoMKgPSBtZGV2X3R5cGVfcmVsZWFzZSwKPiArwqDCoMKgwqDCoMKg
wqAuZGVmYXVsdF9ncm91cHPCoD0gbWRldl90eXBlX2dyb3VwcywKPiDCoH07Cj4gwqAKPiDCoHN0
YXRpYyBpbnQgbWRldl90eXBlX2FkZChzdHJ1Y3QgbWRldl9wYXJlbnQgKnBhcmVudCwgc3RydWN0
Cj4gbWRldl90eXBlICp0eXBlKQo+IEBAIC0xMDYsMTAgKzEyOCw2IEBAIHN0YXRpYyBpbnQgbWRl
dl90eXBlX2FkZChzdHJ1Y3QgbWRldl9wYXJlbnQKPiAqcGFyZW50LCBzdHJ1Y3QgbWRldl90eXBl
ICp0eXBlKQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIHJldDsKPiDC
oMKgwqDCoMKgwqDCoMKgfQo+IMKgCj4gLcKgwqDCoMKgwqDCoMKgcmV0ID0gc3lzZnNfY3JlYXRl
X2ZpbGUoJnR5cGUtPmtvYmosCj4gJm1kZXZfdHlwZV9hdHRyX2NyZWF0ZS5hdHRyKTsKPiAtwqDC
oMKgwqDCoMKgwqBpZiAocmV0KQo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBnb3Rv
IGF0dHJfY3JlYXRlX2ZhaWxlZDsKPiAtCj4gwqDCoMKgwqDCoMKgwqDCoHR5cGUtPmRldmljZXNf
a29iaiA9IGtvYmplY3RfY3JlYXRlX2FuZF9hZGQoImRldmljZXMiLCAmdHlwZS0KPiA+a29iaik7
Cj4gwqDCoMKgwqDCoMKgwqDCoGlmICghdHlwZS0+ZGV2aWNlc19rb2JqKSB7Cj4gwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXQgPSAtRU5PTUVNOwo+IEBAIC0xMjQsOCArMTQyLDYg
QEAgc3RhdGljIGludCBtZGV2X3R5cGVfYWRkKHN0cnVjdCBtZGV2X3BhcmVudAo+ICpwYXJlbnQs
IHN0cnVjdCBtZGV2X3R5cGUgKnR5cGUpCj4gwqBhdHRyc19mYWlsZWQ6Cj4gwqDCoMKgwqDCoMKg
wqDCoGtvYmplY3RfcHV0KHR5cGUtPmRldmljZXNfa29iaik7Cj4gwqBhdHRyX2RldmljZXNfZmFp
bGVkOgo+IC3CoMKgwqDCoMKgwqDCoHN5c2ZzX3JlbW92ZV9maWxlKCZ0eXBlLT5rb2JqLCAmbWRl
dl90eXBlX2F0dHJfY3JlYXRlLmF0dHIpOwo+IC1hdHRyX2NyZWF0ZV9mYWlsZWQ6Cj4gwqDCoMKg
wqDCoMKgwqDCoGtvYmplY3RfZGVsKCZ0eXBlLT5rb2JqKTsKPiDCoMKgwqDCoMKgwqDCoMKga29i
amVjdF9wdXQoJnR5cGUtPmtvYmopOwo+IMKgwqDCoMKgwqDCoMKgwqByZXR1cm4gcmV0Owo+IEBA
IC0xMzYsNyArMTUyLDYgQEAgc3RhdGljIHZvaWQgbWRldl90eXBlX3JlbW92ZShzdHJ1Y3QgbWRl
dl90eXBlCj4gKnR5cGUpCj4gwqDCoMKgwqDCoMKgwqDCoHN5c2ZzX3JlbW92ZV9maWxlcygmdHlw
ZS0+a29iaiwgdHlwZS0+cGFyZW50LT5tZGV2X2RyaXZlci0KPiA+dHlwZXNfYXR0cnMpOwo+IMKg
Cj4gwqDCoMKgwqDCoMKgwqDCoGtvYmplY3RfcHV0KHR5cGUtPmRldmljZXNfa29iaik7Cj4gLcKg
wqDCoMKgwqDCoMKgc3lzZnNfcmVtb3ZlX2ZpbGUoJnR5cGUtPmtvYmosICZtZGV2X3R5cGVfYXR0
cl9jcmVhdGUuYXR0cik7Cj4gwqDCoMKgwqDCoMKgwqDCoGtvYmplY3RfZGVsKCZ0eXBlLT5rb2Jq
KTsKPiDCoMKgwqDCoMKgwqDCoMKga29iamVjdF9wdXQoJnR5cGUtPmtvYmopOwo+IMKgfQo+IGRp
ZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L21kZXYuaCBiL2luY2x1ZGUvbGludXgvbWRldi5oCj4g
aW5kZXggZTQ0NWY4MDljZWNhMy4uYWYxZmYwMTY1YjhkMyAxMDA2NDQKPiAtLS0gYS9pbmNsdWRl
L2xpbnV4L21kZXYuaAo+ICsrKyBiL2luY2x1ZGUvbGludXgvbWRldi5oCj4gQEAgLTYxLDExICs2
MSw2IEBAIHN0cnVjdCBtZGV2X3R5cGVfYXR0cmlidXRlIHsKPiDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc2l6ZV90IGNvdW50KTsKPiDCoH07Cj4gwqAK
PiAtI2RlZmluZSBNREVWX1RZUEVfQVRUUihfbmFtZSwgX21vZGUsIF9zaG93LCBfc3RvcmUpwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgXAo+IC1zdHJ1Y3QgbWRldl90eXBlX2F0dHJpYnV0ZSBtZGV2
X3R5cGVfYXR0cl8jI19uYW1lID3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBcCj4gLcKgwqDCoMKg
wqDCoMKgX19BVFRSKF9uYW1lLCBfbW9kZSwgX3Nob3csIF9zdG9yZSkKPiAtI2RlZmluZSBNREVW
X1RZUEVfQVRUUl9SVyhfbmFtZSkgXAo+IC3CoMKgwqDCoMKgwqDCoHN0cnVjdCBtZGV2X3R5cGVf
YXR0cmlidXRlIG1kZXZfdHlwZV9hdHRyXyMjX25hbWUgPQo+IF9fQVRUUl9SVyhfbmFtZSkKPiDC
oCNkZWZpbmUgTURFVl9UWVBFX0FUVFJfUk8oX25hbWUpIFwKPiDCoMKgwqDCoMKgwqDCoMKgc3Ry
dWN0IG1kZXZfdHlwZV9hdHRyaWJ1dGUgbWRldl90eXBlX2F0dHJfIyNfbmFtZSA9Cj4gX19BVFRS
X1JPKF9uYW1lKQo+IMKgI2RlZmluZSBNREVWX1RZUEVfQVRUUl9XTyhfbmFtZSkgXAo+IEBAIC03
MywxMiArNjgsMTQgQEAgc3RydWN0IG1kZXZfdHlwZV9hdHRyaWJ1dGUgbWRldl90eXBlX2F0dHJf
IyNfbmFtZQo+ID3CoMKgwqDCoMKgwqDCoMKgwqBcCj4gwqAKPiDCoC8qKgo+IMKgICogc3RydWN0
IG1kZXZfZHJpdmVyIC0gTWVkaWF0ZWQgZGV2aWNlIGRyaXZlcgo+ICsgKiBAZGV2aWNlX2FwaTog
c3RyaW5nIHRvIHJldHVybiBmb3IgdGhlIGRldmljZV9hcGkgc3lzZnMKPiDCoCAqIEBwcm9iZTog
Y2FsbGVkIHdoZW4gbmV3IGRldmljZSBjcmVhdGVkCj4gwqAgKiBAcmVtb3ZlOiBjYWxsZWQgd2hl
biBkZXZpY2UgcmVtb3ZlZAo+IMKgICogQHR5cGVzX2F0dHJzOiBhdHRyaWJ1dGVzIHRvIHRoZSB0
eXBlIGtvYmplY3RzLgo+IMKgICogQGRyaXZlcjogZGV2aWNlIGRyaXZlciBzdHJ1Y3R1cmUKPiDC
oCAqKi8KPiDCoHN0cnVjdCBtZGV2X2RyaXZlciB7Cj4gK8KgwqDCoMKgwqDCoMKgY29uc3QgY2hh
ciAqZGV2aWNlX2FwaTsKPiDCoMKgwqDCoMKgwqDCoMKgaW50ICgqcHJvYmUpKHN0cnVjdCBtZGV2
X2RldmljZSAqZGV2KTsKPiDCoMKgwqDCoMKgwqDCoMKgdm9pZCAoKnJlbW92ZSkoc3RydWN0IG1k
ZXZfZGV2aWNlICpkZXYpOwo+IMKgwqDCoMKgwqDCoMKgwqBjb25zdCBzdHJ1Y3QgYXR0cmlidXRl
ICogY29uc3QgKnR5cGVzX2F0dHJzOwo+IGRpZmYgLS1naXQgYS9zYW1wbGVzL3ZmaW8tbWRldi9t
Ym9jaHMuYyBiL3NhbXBsZXMvdmZpby1tZGV2L21ib2Nocy5jCj4gaW5kZXggNGQwODM5Y2I1MTk0
My4uYTJmYzEzZmFkZTc1NyAxMDA2NDQKPiAtLS0gYS9zYW1wbGVzL3ZmaW8tbWRldi9tYm9jaHMu
Ywo+ICsrKyBiL3NhbXBsZXMvdmZpby1tZGV2L21ib2Nocy5jCj4gQEAgLTEzODQsMTcgKzEzODQs
OSBAQCBzdGF0aWMgc3NpemVfdCBhdmFpbGFibGVfaW5zdGFuY2VzX3Nob3coc3RydWN0Cj4gbWRl
dl90eXBlICptdHlwZSwKPiDCoH0KPiDCoHN0YXRpYyBNREVWX1RZUEVfQVRUUl9STyhhdmFpbGFi
bGVfaW5zdGFuY2VzKTsKPiDCoAo+IC1zdGF0aWMgc3NpemVfdCBkZXZpY2VfYXBpX3Nob3coc3Ry
dWN0IG1kZXZfdHlwZSAqbXR5cGUsCj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3RydWN0IG1kZXZfdHlwZV9hdHRyaWJ1dGUgKmF0
dHIsIGNoYXIKPiAqYnVmKQo+IC17Cj4gLcKgwqDCoMKgwqDCoMKgcmV0dXJuIHNwcmludGYoYnVm
LCAiJXNcbiIsIFZGSU9fREVWSUNFX0FQSV9QQ0lfU1RSSU5HKTsKPiAtfQo+IC1zdGF0aWMgTURF
Vl9UWVBFX0FUVFJfUk8oZGV2aWNlX2FwaSk7Cj4gLQo+IMKgc3RhdGljIGNvbnN0IHN0cnVjdCBh
dHRyaWJ1dGUgKm1kZXZfdHlwZXNfYXR0cnNbXSA9IHsKPiDCoMKgwqDCoMKgwqDCoMKgJm1kZXZf
dHlwZV9hdHRyX25hbWUuYXR0ciwKPiDCoMKgwqDCoMKgwqDCoMKgJm1kZXZfdHlwZV9hdHRyX2Rl
c2NyaXB0aW9uLmF0dHIsCj4gLcKgwqDCoMKgwqDCoMKgJm1kZXZfdHlwZV9hdHRyX2RldmljZV9h
cGkuYXR0ciwKPiDCoMKgwqDCoMKgwqDCoMKgJm1kZXZfdHlwZV9hdHRyX2F2YWlsYWJsZV9pbnN0
YW5jZXMuYXR0ciwKPiDCoMKgwqDCoMKgwqDCoMKgTlVMTCwKPiDCoH07Cj4gQEAgLTE0MTAsNiAr
MTQwMiw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgdmZpb19kZXZpY2Vfb3BzCj4gbWJvY2hzX2Rl
dl9vcHMgPSB7Cj4gwqB9Owo+IMKgCj4gwqBzdGF0aWMgc3RydWN0IG1kZXZfZHJpdmVyIG1ib2No
c19kcml2ZXIgPSB7Cj4gK8KgwqDCoMKgwqDCoMKgLmRldmljZV9hcGkgPSBWRklPX0RFVklDRV9B
UElfUENJX1NUUklORywKPiDCoMKgwqDCoMKgwqDCoMKgLmRyaXZlciA9IHsKPiDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoC5uYW1lID0gIm1ib2NocyIsCj4gwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAub3duZXIgPSBUSElTX01PRFVMRSwKPiBkaWZmIC0tZ2l0IGEvc2Ft
cGxlcy92ZmlvLW1kZXYvbWRweS5jIGIvc2FtcGxlcy92ZmlvLW1kZXYvbWRweS5jCj4gaW5kZXgg
NGEzNDFmNDg0OWU3My4uZjkwNjllZDI3NTBmYSAxMDA2NDQKPiAtLS0gYS9zYW1wbGVzL3ZmaW8t
bWRldi9tZHB5LmMKPiArKysgYi9zYW1wbGVzL3ZmaW8tbWRldi9tZHB5LmMKPiBAQCAtNjg5LDE3
ICs2ODksOSBAQCBzdGF0aWMgc3NpemVfdCBhdmFpbGFibGVfaW5zdGFuY2VzX3Nob3coc3RydWN0
Cj4gbWRldl90eXBlICptdHlwZSwKPiDCoH0KPiDCoHN0YXRpYyBNREVWX1RZUEVfQVRUUl9STyhh
dmFpbGFibGVfaW5zdGFuY2VzKTsKPiDCoAo+IC1zdGF0aWMgc3NpemVfdCBkZXZpY2VfYXBpX3No
b3coc3RydWN0IG1kZXZfdHlwZSAqbXR5cGUsCj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3RydWN0IG1kZXZfdHlwZV9hdHRyaWJ1
dGUgKmF0dHIsIGNoYXIKPiAqYnVmKQo+IC17Cj4gLcKgwqDCoMKgwqDCoMKgcmV0dXJuIHNwcmlu
dGYoYnVmLCAiJXNcbiIsIFZGSU9fREVWSUNFX0FQSV9QQ0lfU1RSSU5HKTsKPiAtfQo+IC1zdGF0
aWMgTURFVl9UWVBFX0FUVFJfUk8oZGV2aWNlX2FwaSk7Cj4gLQo+IMKgc3RhdGljIGNvbnN0IHN0
cnVjdCBhdHRyaWJ1dGUgKm1kZXZfdHlwZXNfYXR0cnNbXSA9IHsKPiDCoMKgwqDCoMKgwqDCoMKg
Jm1kZXZfdHlwZV9hdHRyX25hbWUuYXR0ciwKPiDCoMKgwqDCoMKgwqDCoMKgJm1kZXZfdHlwZV9h
dHRyX2Rlc2NyaXB0aW9uLmF0dHIsCj4gLcKgwqDCoMKgwqDCoMKgJm1kZXZfdHlwZV9hdHRyX2Rl
dmljZV9hcGkuYXR0ciwKPiDCoMKgwqDCoMKgwqDCoMKgJm1kZXZfdHlwZV9hdHRyX2F2YWlsYWJs
ZV9pbnN0YW5jZXMuYXR0ciwKPiDCoMKgwqDCoMKgwqDCoMKgTlVMTCwKPiDCoH07Cj4gQEAgLTcx
NCw2ICs3MDYsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHZmaW9fZGV2aWNlX29wcyBtZHB5X2Rl
dl9vcHMKPiA9IHsKPiDCoH07Cj4gwqAKPiDCoHN0YXRpYyBzdHJ1Y3QgbWRldl9kcml2ZXIgbWRw
eV9kcml2ZXIgPSB7Cj4gK8KgwqDCoMKgwqDCoMKgLmRldmljZV9hcGkgPSBWRklPX0RFVklDRV9B
UElfUENJX1NUUklORywKPiDCoMKgwqDCoMKgwqDCoMKgLmRyaXZlciA9IHsKPiDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoC5uYW1lID0gIm1kcHkiLAo+IMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgLm93bmVyID0gVEhJU19NT0RVTEUsCj4gZGlmZiAtLWdpdCBhL3NhbXBs
ZXMvdmZpby1tZGV2L210dHkuYyBiL3NhbXBsZXMvdmZpby1tZGV2L210dHkuYwo+IGluZGV4IDgx
NGE3Zjk4NzM4YTIuLjA2NGU3MWIyOGRkMTkgMTAwNjQ0Cj4gLS0tIGEvc2FtcGxlcy92ZmlvLW1k
ZXYvbXR0eS5jCj4gKysrIGIvc2FtcGxlcy92ZmlvLW1kZXYvbXR0eS5jCj4gQEAgLTEyNzcsMTcg
KzEyNzcsOCBAQCBzdGF0aWMgc3NpemVfdCBhdmFpbGFibGVfaW5zdGFuY2VzX3Nob3coc3RydWN0
Cj4gbWRldl90eXBlICptdHlwZSwKPiDCoAo+IMKgc3RhdGljIE1ERVZfVFlQRV9BVFRSX1JPKGF2
YWlsYWJsZV9pbnN0YW5jZXMpOwo+IMKgCj4gLXN0YXRpYyBzc2l6ZV90IGRldmljZV9hcGlfc2hv
dyhzdHJ1Y3QgbWRldl90eXBlICptdHlwZSwKPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzdHJ1Y3QgbWRldl90eXBlX2F0dHJpYnV0
ZSAqYXR0ciwgY2hhcgo+ICpidWYpCj4gLXsKPiAtwqDCoMKgwqDCoMKgwqByZXR1cm4gc3ByaW50
ZihidWYsICIlc1xuIiwgVkZJT19ERVZJQ0VfQVBJX1BDSV9TVFJJTkcpOwo+IC19Cj4gLQo+IC1z
dGF0aWMgTURFVl9UWVBFX0FUVFJfUk8oZGV2aWNlX2FwaSk7Cj4gLQo+IMKgc3RhdGljIGNvbnN0
IHN0cnVjdCBhdHRyaWJ1dGUgKm1kZXZfdHlwZXNfYXR0cnNbXSA9IHsKPiDCoMKgwqDCoMKgwqDC
oMKgJm1kZXZfdHlwZV9hdHRyX25hbWUuYXR0ciwKPiAtwqDCoMKgwqDCoMKgwqAmbWRldl90eXBl
X2F0dHJfZGV2aWNlX2FwaS5hdHRyLAo+IMKgwqDCoMKgwqDCoMKgwqAmbWRldl90eXBlX2F0dHJf
YXZhaWxhYmxlX2luc3RhbmNlcy5hdHRyLAo+IMKgwqDCoMKgwqDCoMKgwqBOVUxMLAo+IMKgfTsK
PiBAQCAtMTMwMiw2ICsxMjkzLDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCB2ZmlvX2RldmljZV9v
cHMKPiBtdHR5X2Rldl9vcHMgPSB7Cj4gwqB9Owo+IMKgCj4gwqBzdGF0aWMgc3RydWN0IG1kZXZf
ZHJpdmVyIG10dHlfZHJpdmVyID0gewo+ICvCoMKgwqDCoMKgwqDCoC5kZXZpY2VfYXBpID0gVkZJ
T19ERVZJQ0VfQVBJX1BDSV9TVFJJTkcsCj4gwqDCoMKgwqDCoMKgwqDCoC5kcml2ZXIgPSB7Cj4g
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAubmFtZSA9ICJtdHR5IiwKPiDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoC5vd25lciA9IFRISVNfTU9EVUxFLAoK

