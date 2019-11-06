Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5905AF0FD8
	for <lists+intel-gvt-dev@lfdr.de>; Wed,  6 Nov 2019 08:07:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCCF26EBFE;
	Wed,  6 Nov 2019 07:07:19 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91E526EC03
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed,  6 Nov 2019 07:07:18 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-230-sS4JHO2DNtCxuysVDg7ijQ-1; Wed, 06 Nov 2019 02:07:13 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 40F08477;
 Wed,  6 Nov 2019 07:07:09 +0000 (UTC)
Received: from jason-ThinkPad-X1-Carbon-6th.redhat.com
 (ovpn-12-193.pek2.redhat.com [10.72.12.193])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 90FEB1001B39;
 Wed,  6 Nov 2019 07:05:54 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: kvm@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 kwankhede@nvidia.com, alex.williamson@redhat.com, mst@redhat.com,
 tiwei.bie@intel.com
Subject: [PATCH V9 0/6] mdev based hardware virtio offloading support
Date: Wed,  6 Nov 2019 15:05:42 +0800
Message-Id: <20191106070548.18980-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: sS4JHO2DNtCxuysVDg7ijQ-1
X-Mimecast-Spam-Score: 0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1573024037;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=hZQT3duyyndR+0G+CA+4t+0Dt0ILcfgLE6OucGmmjrQ=;
 b=O3Je4FWHx3LyynioWJIxAOuCbXIxAF+FLn1tQZxIldAWHudUr5JlHg3l74UC/Ybl3ZhIcJ
 ayhyjTRUB6cz9XtOCDAFF/aZS06tBNAYzEGM+DAdDuGKIp6GK409V0zCGrLMOJQs1w9s/A
 TpWMaUkLnNlm6DGe2TDpdbxNMyVD0ZQ=
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
Cc: christophe.de.dinechin@gmail.com, sebott@linux.ibm.com, airlied@linux.ie,
 Jason Wang <jasowang@redhat.com>, joonas.lahtinen@linux.intel.com,
 heiko.carstens@de.ibm.com, kevin.tian@intel.com,
 virtualization@lists.linux-foundation.org, rob.miller@broadcom.com,
 lulu@redhat.com, eperezma@redhat.com, pasic@linux.ibm.com,
 borntraeger@de.ibm.com, haotian.wang@sifive.com, zhi.a.wang@intel.com,
 farman@linux.ibm.com, idos@mellanox.com, gor@linux.ibm.com,
 cunming.liang@intel.com, zhenyuw@linux.intel.com, rodrigo.vivi@intel.com,
 xiao.w.wang@intel.com, freude@linux.ibm.com, jani.nikula@linux.intel.com,
 parav@mellanox.com, zhihong.wang@intel.com, stefanha@redhat.com,
 akrowiak@linux.ibm.com, netdev@vger.kernel.org, cohuck@redhat.com,
 oberpar@linux.ibm.com, maxime.coquelin@redhat.com, daniel@ffwll.ch,
 lingshan.zhu@intel.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

SGkgYWxsOgoKVGhlcmUgYXJlIGhhcmR3YXJlcyB0aGF0IGNhbiBkbyB2aXJ0aW8gZGF0YXBhdGgg
b2ZmbG9hZGluZyB3aGlsZQpoYXZpbmcgaXRzIG93biBjb250cm9sIHBhdGguIFRoaXMgcGF0aCB0
cmllcyB0byBpbXBsZW1lbnQgYSBtZGV2IGJhc2VkCnVuaWZpZWQgQVBJIHRvIHN1cHBvcnQgdXNp
bmcga2VybmVsIHZpcnRpbyBkcml2ZXIgdG8gZHJpdmUgdGhvc2UKZGV2aWNlcy4gVGhpcyBpcyBk
b25lIGJ5IGludHJvZHVjaW5nIGEgbmV3IG1kZXYgdHJhbnNwb3J0IGZvciB2aXJ0aW8KKHZpcnRp
b19tZGV2KSBhbmQgcmVnaXN0ZXIgaXRzZWxmIGFzIGEgbmV3IGtpbmQgb2YgbWRldiBkcml2ZXIu
IFRoZW4KaXQgcHJvdmlkZXMgYSB1bmlmaWVkIHdheSBmb3Iga2VybmVsIHZpcnRpbyBkcml2ZXIg
dG8gdGFsayB3aXRoIG1kZXYKZGV2aWNlIGltcGxlbWVudGF0aW9uLgoKVGhvdWdoIHRoZSBzZXJp
ZXMgb25seSBjb250YWlucyBrZXJuZWwgZHJpdmVyIHN1cHBvcnQsIHRoZSBnb2FsIGlzIHRvCm1h
a2UgdGhlIHRyYW5zcG9ydCBnZW5lcmljIGVub3VnaCB0byBzdXBwb3J0IHVzZXJzcGFjZSBkcml2
ZXJzLiBUaGlzCm1lYW5zIHZob3N0LW1kZXZbMV0gY291bGQgYmUgYnVpbHQgb24gdG9wIGFzIHdl
bGwgYnkgcmVzdWluZyB0aGUKdHJhbnNwb3J0LgoKQSBzYW1wbGUgZHJpdmVyIGlzIGFsc28gaW1w
bGVtZW50ZWQgd2hpY2ggc2ltdWxhdGUgYSB2aXJpdG8tbmV0Cmxvb3BiYWNrIGV0aGVybmV0IGRl
dmljZSBvbiB0b3Agb2YgdnJpbmdoICsgd29ya3F1ZXVlLiBUaGlzIGNvdWxkIGJlCnVzZWQgYXMg
YSByZWZlcmVuY2UgaW1wbGVtZW50YXRpb24gZm9yIHJlYWwgaGFyZHdhcmUgZHJpdmVyLgoKQWxz
byBhIHJlYWwgSUZDIFZGIGRyaXZlciB3YXMgYWxzbyBwb3N0ZWQgaGVyZVsyXSB3aGljaCBpcyBh
IGdvb2QKcmVmZXJlbmNlIGZvciB2ZW5kb3JzIHdobyBpcyBpbnRlcmVzdGVkIGluIHRoZWlyIG93
biB2aXJ0aW8gZGF0YXBhdGgKb2ZmbG9hZGluZyBwcm9kdWN0LgoKQ29uc2lkZXIgbWRldiBmcmFt
ZXdvcmsgb25seSBzdXBwb3J0IFZGSU8gZGV2aWNlIGFuZCBkcml2ZXIgcmlnaHQgbm93LAp0aGlz
IHNlcmllcyBhbHNvIGV4dGVuZCBpdCB0byBzdXBwb3J0IG90aGVyIHR5cGVzLiBUaGlzIGlzIGRv
bmUKdGhyb3VnaCBpbnRyb2R1Y2luZyBjbGFzcyBpZCB0byB0aGUgZGV2aWNlIGFuZCBwYWlyaW5n
IGl0IHdpdGgKaWRfdGFsYmUgY2xhaW1lZCBieSB0aGUgZHJpdmVyLiBPbiB0b3AsIHRoaXMgc2Vy
aXMgYWxzbyBkZWNvdXBsZQpkZXZpY2Ugc3BlY2lmaWMgcGFyZW50cyBvcHMgb3V0IG9mIHRoZSBj
b21tb24gb25lcy4KClBrdGdlbiB0ZXN0IHdhcyBkb25lIHdpdGggdmlyaXRvLW5ldCArIG12bmV0
IGxvb3AgYmFjayBkZXZpY2UuCgpQbGVhc2UgcmV2aWV3LgoKWzFdIGh0dHBzOi8vbGttbC5vcmcv
bGttbC8yMDE5LzExLzUvNDI0ClsyXSBodHRwczovL2xrbWwub3JnL2xrbWwvMjAxOS8xMS81LzIy
NwoKQ2hhbmdlcyBmcm9tIFY4OgotIHRyeSBzaWxlbnQgY2hlY2twYXRjaCwgc29tZSBhcmUgc3Rp
bGwgdGhlcmUgYmVjdWFzZSB0aGV5IHdlcmUgaW5oZXJpdGVkCiAgZnJvbSB2aXJ0aW9fY29uZmln
X29wcyB3aGljaCBuZWVkcyB0byBiZSByZXNvbHZlZCBpbiBhbiBpbmRlcGVuZGVudCBzZXJpZXMK
LSB0d2VhayBvbiB0aGUgY29tbWVudCBhbmQgZG9jCi0gcmVtb3ZlIFZJUlRJT19NREVWX0ZfVkVS
U0lPTl8xIGNvbXBsZXRlbHkKLSByZW5hbWUgQ09ORklHX1ZJUlRJT19NREVWX0RFVklDRSB0byBD
T05GSUdfVklSVElPX01ERVYKCkNoYW5nZXMgZnJvbSBWNzoKLSBkcm9wIHtzZXR8Z2V0fV9tZGV2
X2ZlYXR1cmVzIGZvciB2aXJ0aW8KLSB0eXBvIGFuZCBjb21tZW50IHN0eWxlIGZpeGVzCgpDaGFu
Z2VzIGZyb20gVjY6Ci0gcmVuYW1lIG9wcyBmaWxlcyBhbmQgY29tcGlsZSBndWFyZAoKQ2hhbmdl
cyBmcm9tIFY1OgotIHVzZSBkZXZfd2FybigpIGluc3RlYWQgb2YgV0FSTigxKSB3aGVuIGNsYXNz
IGlkIGlzIG5vdCBzZXQKLSB2YWxpZGF0ZSBpZF90YWJsZSBiZWZvcmUgdHJ5aW5nIHRvIGRvIG1h
dGNoaW5nIGJldHdlZW4gZGV2aWNlIGFuZAogIGRyaXZlcgotIGFkZCB3aWxkY2FyZCBmb3IgbW9k
cG9zdCBzY3JpcHQKLSB1c2UgdW5pcXVlIG5hbWUgZm9yIGlkX3RhYmxlCi0gbW92ZSBnZXRfbWRl
dl9mZWF0dXJlcygpIHRvIGJlIHRoZSBmaXJzdCBtZW1iZXIgb2YgdmlydGlvX2RldmljZV9vcHMK
ICBhbmQgbW9yZSBjb21tZW50cyBmb3IgaXQKLSB0eXBvIGZpeGVzIGZvciB0aGUgY29tbWVudHMg
YWJvdmUgdmlydGlvX21kZXZfb3BzCgpDaGFuZ2VzIGZyb20gVjQ6Ci0ga2VlcCBtZGV2X3NldF9j
bGFzcygpIGZvciB0aGUgZGV2aWNlIHRoYXQgZG9lc24ndCB1c2UgZGV2aWNlIG9wcwotIHVzZSB1
bmlvbiBmb3IgZGV2aWNlIG9wcyBwb2ludGVyIGluIG1kZXZfZGV2aWNlCi0gaW50cm9kdWNlIGNs
YXNzIHNwZWNpZmljIGhlbHBlciBmb3IgZ2V0dGluZyBpcyBkZXZpY2Ugb3BzCi0gdXNlIFdBUk5f
T04gaW5zdGVhZCBvZiBCVUdfT04gaW4gbWRldl9zZXRfdmlydGlvX29wcwotIGV4cGxhaW4gZGV0
YWlscyBvZiBnZXRfbWRldl9mZWF0dXJlcygpIGFuZCBnZXRfdmVuZG9yX2lkKCkKLSBkaXN0aW5n
dWlzaCB0aGUgb3B0aW9uYWwgdmlyaXRvIGRldmljZSBvcHMgZnJvbSBtYW5kYXRvcnkgb25lcyBh
bmQKICBtYWtlIGdldF9nZW5lcmF0aW9uKCkgb3B0aW9uYWwKLSByZW5hbWUgdmZpb19tZGV2Lmgg
dG8gdmZpb19tZGV2X29wcy5oLCByZW5hbWUgdmlyaXRvX21kZXYuaCB0bwogIHZpcnRpb19tZGV2
X29wcy5oCi0gZG9uJ3QgYWJ1c2UgdmVyc2lvbiBmaWxlZHMgaW4gdmlydGlvX21kZXYgc3RydWN0
dXJlLCB1c2UgZmVhdHVyZXMKICBpbnN0ZWFkCi0gZml4IHdhcm5pbmcgZHVyaW5nIGRldmljZSBy
ZW1vdmUKLSBzdHlsZSAmIGRvY3MgdHdlYWtzIGFuZCB0eXBvIGZpeGVzCgpDaGFuZ2VzIGZyb20g
VjM6Ci0gZG9jdW1lbnQgdGhhdCBjbGFzcyBpZCAoZGV2aWNlIG9wcykgbXVzdCBiZSBzcGVjaWZp
ZWQgaW4gY3JlYXRlKCkKLSBhZGQgV0FSTigpIHdoZW4gdHJ5aW5nIHRvIHNldCBjbGFzc19pZCB3
aGVuIGl0IGhhcyBhbHJlYWR5IHNldAotIGFkZCBXQVJOKCkgd2hlbiBjbGFzc19pZCBpcyBub3Qg
c3BlY2lmaWVkIGluIGNyZWF0ZSgpIGFuZCBjb3JyZWN0bHkKICByZXR1cm4gYW4gZXJyb3IgaW4g
dGhpcyBjYXNlCi0gY29ycmVjdCB0aGUgcHJvdG90eXBlIG9mIG1kZXZfc2V0X2NsYXNzKCkgaW4g
dGhlIGRvYwotIGFkZCBkb2N1bWVudGlvbiBvZiBtZGV2X3NldF9jbGFzcygpCi0gcmVtb3ZlIHRo
ZSB1bm5lY2Vzc2FyeSAiY2xhc3NfaWRfZmFpbCIgbGFiZWwgd2hlbiBjbGFzcyBpZCBpcyBub3QK
ICBzcGVjaWZpZWQgaW4gY3JlYXRlKCkKLSBjb252ZXJ0IGlkX3RhYmxlIGluIHZmaW9fbWRldiB0
byBjb25zdAotIG1vdmUgbWRldl9zZXRfY2xhc3MgYW5kIGl0cyBmcmllbmRzIGFmdGVyIG1kZXZf
dXVpZCgpCi0gc3VxYXNoIHRoZSBwYXRjaCBvZiBidXMgdWV2ZW50IGludG8gcGF0Y2ggb2YgaW50
cm9kdWNpbmcgY2xhc3MgaWQKLSB0d2VhayB0aGUgd29yZHMgaW4gdGhlIGRvY3MgcGVyIENvcm5l
bGlhIHN1Z2dlc3Rpb24KLSB0aWUgY2xhc3NfaWQgYW5kIGRldmljZSBvcHMgdGhyb3VnaCBjbGFz
cyBzcGVjaWZpYyBpbml0aWFsaXphdGlvbgogIHJvdXRpbmUgbGlrZSBtZGV2X3NldF92ZmlvX29w
cygpCi0gdHlwb3MgZml4ZXMgaW4gdGhlIGRvY3Mgb2YgdmlydGlvLW1kZXYgY2FsbGJhY2tzCi0g
ZG9jdW1lbnQgdGhlIHVzYWdlIG9mIHZpcnRxdWV1ZXMgaW4gc3RydWN0IHZpcnRpb19tZGV2X2Rl
dmljZQotIHJlbW92ZSB0aGUgdXNlbGVzcyB2cXMgYXJyYXkgaW4gc3RydWN0IHZpcnRpb19tZGV2
X2RldmljZQotIHJlbmFtZSBNREVWX0lEX1hYWCB0byBNREVWX0NMQVNTX0lEX1hYWAoKQ2hhbmdl
cyBmcm9tIFYyOgotIGZhaWwgd2hlbiBjbGFzc19pZCBpcyBub3Qgc3BlY2lmaWVkCi0gZHJvcCB0
aGUgdnJpbmdoIHBhdGNoCi0gbWF0Y2ggdGhlIGRvYyB0byB0aGUgY29kZQotIHR3ZWFrIHRoZSBj
b21taXQgbG9nCi0gbW92ZSBkZXZpY2Vfb3BzIGZyb20gcGFyZW50IHRvIG1kZXYgZGV2aWNlCi0g
cmVtb3ZlIHRoZSB1bnVzZWQgTURFVl9JRF9WSE9TVAoKQ2hhbmdlcyBmcm9tIFYxOgotIG1vdmUg
dmlydGlvX21kZXYuYyB0byBkcml2ZXJzL3ZpcnRpbwotIHN0b3JlIGNsYXNzX2lkIGluIG1kZXZf
ZGV2aWNlIGluc3RlYWQgb2YgbWRldl9wYXJlbnQKLSBzdG9yZSBkZXZpY2Vfb3BzIGluIG1kZXZf
ZGV2aWNlIGluc3RlYWQgb2YgbWRldl9wYXJlbnQKLSByZW9yZGVyIHRoZSBwYXRjaCwgdnJpbmdo
IGZpeCBjb21lcyBmaXJzdAotIHJlYWxseSBzaWxlbnQgY29tcGlsaW5nIHdhcm5pbmdzCi0gcmVh
bGx5IHN3aXRjaCB0byB1c2UgdTE2IGZvciBjbGFzc19pZAotIHVldmVudCBhbmQgbW9kcG9zdCBz
dXBwb3J0IGZvciBtZGV2IGNsYXNzX2lkCi0gdnJhaW91cyB0d2Vha3MgcGVyIGNvbW1lbnRzIGZy
b20gUGFyYXYKCkNoYW5nZXMgZnJvbSBSRkMtVjI6Ci0gc2lsZW50IGNvbXBpbGUgd2FybmluZ3Mg
b24gc29tZSBzcGVjaWZpYyBjb25maWd1cmF0aW9uCi0gdXNlIHUxNiBpbnN0ZWFkIHU4IGZvciBj
bGFzcyBpZAotIHJlc2V2ZSBNREVWX0lEX1ZIT1NUIGZvciBmdXR1cmUgdmhvc3QtbWRldiB3b3Jr
Ci0gaW50cm9kdWNlICJ2aXJ0aW8iIHR5cGUgZm9yIG12bmV0IGFuZCBtYWtlICJ2aG9zdCIgdHlw
ZSBmb3IgZnV0dXJlCiAgd29yawotIGFkZCBlbnRyaWVzIGluIE1BSU5UQUlORVIKLSB0d2VhayBh
bmQgdHlwb3MgZml4ZXMgaW4gY29tbWl0IGxvZwoKQ2hhbmdlcyBmcm9tIFJGQy1WMToKLSByZW5h
bWUgZGV2aWNlIGlkIHRvIGNsYXNzIGlkCi0gYWRkIGRvY3MgZm9yIGNsYXNzIGlkIGFuZCBkZXZp
Y2Ugc3BlY2lmaWMgb3BzIChkZXZpY2Vfb3BzKQotIHNwbGl0IGRldmljZV9vcHMgaW50byBzZXBl
cmF0ZSBoZWFkZXJzCi0gZHJvcCB0aGUgbWRldl9zZXRfZG1hX29wcygpCi0gdXNlIGRldmljZV9v
cHMgdG8gaW1wbGVtZW50IHRoZSB0cmFuc3BvcnQgQVBJLCB0aGVuIGl0J3Mgbm90IGEgcGFydAog
IG9mIFVBUEkgYW55IG1vcmUKLSB1c2UgR0ZQX0FUT01JQyBpbiBtdm5ldCBzYW1wbGUgZGV2aWNl
IGFuZCBvdGhlciB0d2Vha3MKLSBzZXRfdnJpbmdfYmFzZS9nZXRfdnJpbmdfYmFzZSBzdXBwb3J0
IGZvciBtdm5ldCBkZXZpY2UKCkphc29uIFdhbmcgKDYpOgogIG1kZXY6IGNsYXNzIGlkIHN1cHBv
cnQKICBtb2Rwb3N0OiBhZGQgc3VwcG9ydCBmb3IgbWRldiBjbGFzcyBpZAogIG1kZXY6IGludHJv
ZHVjZSBkZXZpY2Ugc3BlY2lmaWMgb3BzCiAgbWRldjogaW50cm9kdWNlIHZpcnRpbyBkZXZpY2Ug
YW5kIGl0cyBkZXZpY2Ugb3BzCiAgdmlydGlvOiBpbnRyb2R1Y2UgYSBtZGV2IGJhc2VkIHRyYW5z
cG9ydAogIGRvY3M6IHNhbXBsZSBkcml2ZXIgdG8gZGVtb25zdHJhdGUgaG93IHRvIGltcGxlbWVu
dCB2aXJ0aW8tbWRldgogICAgZnJhbWV3b3JrCgogLi4uL2RyaXZlci1hcGkvdmZpby1tZWRpYXRl
ZC1kZXZpY2UucnN0ICAgICAgIHwgIDM4ICstCiBNQUlOVEFJTkVSUyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgfCAgIDMgKwogZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2t2bWd0
LmMgICAgICAgICAgICAgIHwgIDE3ICstCiBkcml2ZXJzL3MzOTAvY2lvL3ZmaW9fY2N3X29wcy5j
ICAgICAgICAgICAgICAgfCAgMTcgKy0KIGRyaXZlcnMvczM5MC9jcnlwdG8vdmZpb19hcF9vcHMu
YyAgICAgICAgICAgICB8ICAxMyArLQogZHJpdmVycy92ZmlvL21kZXYvbWRldl9jb3JlLmMgICAg
ICAgICAgICAgICAgIHwgIDYwICsrCiBkcml2ZXJzL3ZmaW8vbWRldi9tZGV2X2RyaXZlci5jICAg
ICAgICAgICAgICAgfCAgMjUgKwogZHJpdmVycy92ZmlvL21kZXYvbWRldl9wcml2YXRlLmggICAg
ICAgICAgICAgIHwgICA4ICsKIGRyaXZlcnMvdmZpby9tZGV2L3ZmaW9fbWRldi5jICAgICAgICAg
ICAgICAgICB8ICA0NSArLQogZHJpdmVycy92aXJ0aW8vS2NvbmZpZyAgICAgICAgICAgICAgICAg
ICAgICAgIHwgIDEzICsKIGRyaXZlcnMvdmlydGlvL01ha2VmaWxlICAgICAgICAgICAgICAgICAg
ICAgICB8ICAgMSArCiBkcml2ZXJzL3ZpcnRpby92aXJ0aW9fbWRldi5jICAgICAgICAgICAgICAg
ICAgfCA0MDYgKysrKysrKysrKysKIGluY2x1ZGUvbGludXgvbWRldi5oICAgICAgICAgICAgICAg
ICAgICAgICAgICB8ICA1NyArLQogaW5jbHVkZS9saW51eC9tZGV2X3ZmaW9fb3BzLmggICAgICAg
ICAgICAgICAgIHwgIDUyICsrCiBpbmNsdWRlL2xpbnV4L21kZXZfdmlydGlvX29wcy5oICAgICAg
ICAgICAgICAgfCAxNDcgKysrKwogaW5jbHVkZS9saW51eC9tb2RfZGV2aWNldGFibGUuaCAgICAg
ICAgICAgICAgIHwgICA4ICsKIHNhbXBsZXMvS2NvbmZpZyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICB8ICAxMCArCiBzYW1wbGVzL3ZmaW8tbWRldi9NYWtlZmlsZSAgICAgICAgICAgICAg
ICAgICAgfCAgIDEgKwogc2FtcGxlcy92ZmlvLW1kZXYvbWJvY2hzLmMgICAgICAgICAgICAgICAg
ICAgIHwgIDE5ICstCiBzYW1wbGVzL3ZmaW8tbWRldi9tZHB5LmMgICAgICAgICAgICAgICAgICAg
ICAgfCAgMTkgKy0KIHNhbXBsZXMvdmZpby1tZGV2L210dHkuYyAgICAgICAgICAgICAgICAgICAg
ICB8ICAxNyArLQogc2FtcGxlcy92ZmlvLW1kZXYvbXZuZXQuYyAgICAgICAgICAgICAgICAgICAg
IHwgNjg2ICsrKysrKysrKysrKysrKysrKwogc2NyaXB0cy9tb2QvZGV2aWNldGFibGUtb2Zmc2V0
cy5jICAgICAgICAgICAgIHwgICAzICsKIHNjcmlwdHMvbW9kL2ZpbGUyYWxpYXMuYyAgICAgICAg
ICAgICAgICAgICAgICB8ICAxMSArCiAyNCBmaWxlcyBjaGFuZ2VkLCAxNTg1IGluc2VydGlvbnMo
KyksIDkxIGRlbGV0aW9ucygtKQogY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvdmlydGlvL3Zp
cnRpb19tZGV2LmMKIGNyZWF0ZSBtb2RlIDEwMDY0NCBpbmNsdWRlL2xpbnV4L21kZXZfdmZpb19v
cHMuaAogY3JlYXRlIG1vZGUgMTAwNjQ0IGluY2x1ZGUvbGludXgvbWRldl92aXJ0aW9fb3BzLmgK
IGNyZWF0ZSBtb2RlIDEwMDY0NCBzYW1wbGVzL3ZmaW8tbWRldi9tdm5ldC5jCgotLSAKMi4xOS4x
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppbnRlbC1n
dnQtZGV2IG1haWxpbmcgbGlzdAppbnRlbC1ndnQtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWd2dC1k
ZXY=
