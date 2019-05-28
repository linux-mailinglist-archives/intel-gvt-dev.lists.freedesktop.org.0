Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D8C192DBFF
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 29 May 2019 13:37:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98511890B3;
	Wed, 29 May 2019 11:37:42 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E008C890B3
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 29 May 2019 11:37:40 +0000 (UTC)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4TBWNsS147029
 for <intel-gvt-dev@lists.freedesktop.org>; Wed, 29 May 2019 07:37:39 -0400
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ssr7gavg3-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <intel-gvt-dev@lists.freedesktop.org>; Wed, 29 May 2019 07:37:38 -0400
Received: from localhost
 by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <intel-gvt-dev@lists.freedesktop.org> from <fiuczy@linux.ibm.com>;
 Wed, 29 May 2019 12:37:36 +0100
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
 by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 29 May 2019 12:37:27 +0100
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x4TBbPjW36307154
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 29 May 2019 11:37:25 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8D45AA4040;
 Wed, 29 May 2019 11:37:25 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 840C1A4055;
 Wed, 29 May 2019 11:37:24 +0000 (GMT)
Received: from [10.0.2.15] (unknown [9.152.222.40])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 29 May 2019 11:37:24 +0000 (GMT)
Subject: Re: [libvirt] [PATCH v2 1/2] vfio/mdev: add version attribute for
 mdev device
To: Alex Williamson <alex.williamson@redhat.com>
References: <20190506014514.3555-1-yan.y.zhao@intel.com>
 <20190506014904.3621-1-yan.y.zhao@intel.com>
 <20190507151826.502be009@x1.home> <20190508112740.GA24397@joy-OptiPlex-7040>
 <20190508152242.4b54a5e7@x1.home>
 <5eac912c-e753-b5f6-83a4-b646f991d858@linux.ibm.com>
 <20190514093140.68cc6f7a@x1.home>
From: Boris Fiuczynski <fiuczy@linux.ibm.com>
Date: Tue, 28 May 2019 22:57:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190514093140.68cc6f7a@x1.home>
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 19052911-0016-0000-0000-000002809C8F
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19052911-0017-0000-0000-000032DDACFC
Message-Id: <0c1f5f03-1895-b9a2-999f-f611dd295732@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-29_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1905290078
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
Cc: "cjia@nvidia.com" <cjia@nvidia.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>, "aik@ozlabs.ru" <aik@ozlabs.ru>,
 "Zhengxiao.zx@alibaba-inc.com" <Zhengxiao.zx@alibaba-inc.com>,
 "shuangtai.tst@alibaba-inc.com" <shuangtai.tst@alibaba-inc.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "kwankhede@nvidia.com" <kwankhede@nvidia.com>,
 "eauger@redhat.com" <eauger@redhat.com>, Tony@pps.reinject, "Liu,
 Yi L" <yi.l.liu@intel.com>, "eskultet@redhat.com" <eskultet@redhat.com>, "Yang,
 Ziye" <ziye.yang@intel.com>, "mlevitsk@redhat.com" <mlevitsk@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 "libvir-list@redhat.com" <libvir-list@redhat.com>,
 "arei.gonglei@huawei.com" <arei.gonglei@huawei.com>,
 "felipe@nutanix.com" <felipe@nutanix.com>, "Ken.Xue@amd.com" <Ken.Xue@amd.com>,
 "Tian, Kevin" <kevin.tian@intel.com>, Yan Zhao <yan.y.zhao@intel.com>,
 "dgilbert@redhat.com" <dgilbert@redhat.com>,
 "zhenyuw@linux.intel.com" <zhenyuw@linux.intel.com>,
 "dinechin@redhat.com" <dinechin@redhat.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "Liu, Changpeng" <changpeng.liu@intel.com>, Krowiak <akrowiak@linux.ibm.com>,
 Pierre Morel <pmorel@linux.ibm.com>, "cohuck@redhat.com" <cohuck@redhat.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Wang,
 Zhi A" <zhi.a.wang@intel.com>,
 "jonathan.davies@nutanix.com" <jonathan.davies@nutanix.com>, "He,
 Shaopeng" <shaopeng.he@intel.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

T24gNS8xNC8xOSA1OjMxIFBNLCBBbGV4IFdpbGxpYW1zb24gd3JvdGU6Cj4gT24gV2VkLCA4IE1h
eSAyMDE5IDE3OjI3OjQ3ICswMjAwCj4gQm9yaXMgRml1Y3p5bnNraSA8Zml1Y3p5QGxpbnV4Lmli
bS5jb20+IHdyb3RlOgo+IAo+PiBPbiA1LzgvMTkgMTE6MjIgUE0sIEFsZXggV2lsbGlhbXNvbiB3
cm90ZToKPj4+Pj4gSSB0aG91Z2h0IHRoZXJlIHdhcyBhIHJlcXVlc3QgdG8gbWFrZSB0aGlzIG1v
cmUgc3BlY2lmaWMgdG8gbWlncmF0aW9uCj4+Pj4+IGJ5IHJlbmFtaW5nIGl0IHRvIHNvbWV0aGlu
ZyBsaWtlIG1pZ3JhdGlvbl92ZXJzaW9uLiAgQWxzbywgYXMgYW4KPj4+Pj4gICAgICAKPj4+PiBz
byB0aGlzIGF0dHJpYnV0ZSBtYXkgbm90IG9ubHkgaW5jbHVkZSBhIG1kZXYgZGV2aWNlJ3MgcGFy
ZW50IGRldmljZSBpbmZvIGFuZAo+Pj4+IG1kZXYgdHlwZSwgYnV0IGFsc28gaW5jbHVkZSBudW1l
cmljIHNvZnR3YXJlIHZlcnNpb24gb2YgdmVuZG9yIHNwZWNpZmljCj4+Pj4gbWlncmF0aW9uIGNv
ZGUsIHJpZ2h0Pwo+Pj4gSXQncyBhIHZlbmRvciBkZWZpbmVkIHN0cmluZywgaXQgc2hvdWxkIGJl
IGNvbnNpZGVyZWQgb3BhcXVlIHRvIHRoZQo+Pj4gdXNlciwgdGhlIHZlbmRvciBjYW4gaW5jbHVk
ZSB3aGF0ZXZlciB0aGV5IGZlZWwgaXMgcmVsZXZhbnQuCj4+PiAgICAKPj4gV291bGQgYSB2ZW5k
b3IgYWxzbyBiZSBhbGxvd2VkIHRvIHByb3ZpZGUgYSBzdHJpbmcgZXhwcmVzc2luZyByZXF1aXJl
ZAo+PiBmZWF0dXJlcyBhcyB3ZWxsIGFzIGNvbnRhaW5pbmcgYmFja2VuZCByZXNvdXJjZSByZXF1
aXJlbWVudHMgd2hpY2ggbmVlZAo+PiB0byBiZSBjb21wYXRpYmxlIGZvciBhIHN1Y2Nlc3NmdWwg
bWlncmF0aW9uPyBTb21laG93IGEgYml0IGxpa2UgYSBjcHUKPj4gbW9kZWwuLi4gbWF5YmUgZXZl
biBhcyBqc29uIG9yIHhtbC4uLgo+PiBJIGFtIGFza2luZyB0aGlzIHdpdGggdmZpby1hcCBpbiBt
aW5kLiBJbiB0aGF0IGNvbnRleHQgY2hlY2tpbmcKPj4gY29tcGF0aWJpbGl0eSBvZiB0d28gdmZp
by1hcCBtZGV2IGRldmljZXMgaXMgbm90IGFzIHNpbXBsZSBhcyBjaGVja2luZwo+PiBpZiB2ZXJz
aW9uIEEgaXMgc21hbGxlciBvciBlcXVhbCB0byB2ZXJzaW9uIEIuCj4gCj4gVHdvIHBpZWNlcyB0
byB0aGlzLCB0aGUgZmlyc3QgaXMgdGhhdCB0aGUgc3RyaW5nIGlzIG9wYXF1ZSBleGFjdGx5IHNv
Cj4gdGhhdCB0aGUgdmVuZG9yIGRyaXZlciBjYW4gZXhwcmVzcyB3aGF0ZXZlciB0aGV5IG5lZWQg
aW4gaXQuICBUaGUgdXNlcgo+IHNob3VsZCBuZXZlciBpbmZlciB0aGF0IHR3byBkZXZpY2VzIGFy
ZSBjb21wYXRpYmxlLiAgVGhlIHNlY29uZCBpcyB0aGF0CkkgYWdyZWUuCgo+IHRoaXMgaXMgbm90
IGEgcmVzb3VyY2UgYXZhaWxhYmlsaXR5IG9yIHJlc2VydmF0aW9uIGludGVyZmFjZS4gIFRoZSBm
YWN0CkkgYWxzbyBhZ3JlZS4gVGhlIG1pZ3JhdGlvbl92ZXJzaW9uICh2ZXJzaW9uIGluIHRoaXMg
Y2FzZSBpcyBub3QgcmVhbGx5IAphIGdvb2QgZml0KSBpcyBhIHN1bW1hcnkgb2YgcmVxdWlyZW1l
bnRzIHRoZSBzb3VyY2UgbWRldiBoYXMgd2hpY2ggYSAKdGFyZ2V0IG1kZXYgbmVlZHMgdG8gYmUg
YWJsZSB0byBmdWxmaWxsIGluIG9yZGVyIHRvIGFsbG93IG1pZ3JhdGlvbi4KVGhlIHRhcmdldCBt
ZGV2IGFscmVhZHkgZXhpc3RzIGFuZCB3YXMgYWxyZWFkeSBjb25maWd1cmVkIGJ5IG90aGVyIG1l
YW5zIApub3QgaW52b2x2ZWQgaW4gdGhlIG1pZ3JhdGlvbiBjaGVjayBwcm9jZXNzLgpVc2luZyB0
aGUgbWlncmF0aW9uc192ZXJzaW9uIGFzIHNvbWUga2luZCBvZiBjb25maWd1cmF0aW9uIHRyYW5z
cG9ydCAKYW5kL29yIHJlc2VydmF0aW9uIG1lY2hhbmlzbSB3YXNuJ3QgbXkgaW50ZW50aW9uIGFu
ZCBJTUhPIHdvdWxkIGJvdGggYmUgCndyb25nLgoKPiB0aGF0IGEgdGFyZ2V0IGRldmljZSB3b3Vs
ZCBiZSBjb21wYXRpYmxlIGZvciBtaWdyYXRpb24gc2hvdWxkIG5vdCB0YWtlCj4gaW50byBhY2Nv
dW50IHdoZXRoZXIgdGhlIHRhcmdldCBoYXMgdGhlIHJlc291cmNlcyB0byBhY3R1YWxseSBjcmVh
dGUKPiBzdWNoIGEgZGV2aWNlLiAgRG9pbmcgc28gd291bGQgaW1wbHkgc29tZSBzb3J0IG9mIHJl
c291cmNlIHJlc2VydmF0aW9uCj4gc3VwcG9ydCB0aGF0IGRvZXMgbm90IGV4aXN0LiAgTWF0cml4
IGRldmljZXMgYXJlIGNsZWFybHkgYSBiaXQKPiBjb21wbGljYXRlZCBoZXJlIHNpbmNlIG1heWJl
IHRoZSBzb3VyY2UgaXMgZXhwcmVzc2luZyBhIGNvbXBvbmVudCBvZgo+IHRoZSBkZXZpY2UgdGhh
dCBkb2Vzbid0IGV4aXN0IG9uIHRoZSB0YXJnZXQuICBJbiBzdWNoIGEgInJlc291cmNlIG5vdAo+
IGF2YWlsYWJsZSBhdCBhbGwiIGNhc2UsIGl0IG1pZ2h0IGJlIGZhaXIgdG8gbmFrIHRoZSBjb21w
YXRpYmlsaXR5IHRlc3QsCj4gYnV0IGEgIm9rLCBidXQgcmVzb3VyY2Ugbm90IGN1cnJlbnRseSBh
dmFpbGFibGUiIGNhc2Ugc2hvdWxkIHBhc3MsCj4gaW1vLiAgVGhhbmtzLAo+IAo+IEFsZXgKPiAK
PiAtLQo+IGxpYnZpci1saXN0IG1haWxpbmcgbGlzdAo+IGxpYnZpci1saXN0QHJlZGhhdC5jb20K
PiBodHRwczovL3d3dy5yZWRoYXQuY29tL21haWxtYW4vbGlzdGluZm8vbGlidmlyLWxpc3QKPiAK
CgotLSAKTWl0IGZyZXVuZGxpY2hlbiBHcsO8w59lbi9LaW5kIHJlZ2FyZHMKICAgIEJvcmlzIEZp
dWN6eW5za2kKCklCTSBEZXV0c2NobGFuZCBSZXNlYXJjaCAmIERldmVsb3BtZW50IEdtYkgKVm9y
c2l0emVuZGVyIGRlcyBBdWZzaWNodHNyYXRzOiBNYXR0aGlhcyBIYXJ0bWFubgpHZXNjaMOkZnRz
ZsO8aHJ1bmc6IERpcmsgV2l0dGtvcHAKU2l0eiBkZXIgR2VzZWxsc2NoYWZ0OiBCw7ZibGluZ2Vu
ClJlZ2lzdGVyZ2VyaWNodDogQW10c2dlcmljaHQgU3R1dHRnYXJ0LCBIUkIgMjQzMjk0CgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppbnRlbC1ndnQtZGV2
IG1haWxpbmcgbGlzdAppbnRlbC1ndnQtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWd2dC1kZXY=
