Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8595D689DF6
	for <lists+intel-gvt-dev@lfdr.de>; Fri,  3 Feb 2023 16:19:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56C9E10E077;
	Fri,  3 Feb 2023 15:19:53 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B63610E077
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri,  3 Feb 2023 15:19:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675437590;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7RU9RbEOh3eKCIQ3RrnoIe0lG1ICTmNajMpPLrcQtv8=;
 b=XmgqB4hM/izPKPr2CIOMWODLEVLrwOa9h8DuvoEJV9HHyCxc+CoZnQtSfCDFe3cfC/ZBh3
 uqjQYinWjBmX75xdrgNXSnxjFzyoiG9qbHiY1Knzb2jPSSs+ubidVp3iRz/D57L6DOmcil
 dXS6W2eJ9o0dlxkqceDmk7FjosCxn+s=
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com
 [209.85.166.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-539-XWLidZpAMsq0ooElT8IlOg-1; Fri, 03 Feb 2023 10:19:47 -0500
X-MC-Unique: XWLidZpAMsq0ooElT8IlOg-1
Received: by mail-io1-f72.google.com with SMTP id
 e16-20020a6b5010000000b00719041c51ebso3161456iob.12
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 03 Feb 2023 07:19:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:organization:references
 :in-reply-to:message-id:subject:cc:to:from:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3g9NXrofpUX/HnzotWG0ahi/8nrSPeNR8z5upflUFxU=;
 b=pSqKMxiETyMt7hZsjauDjkplQxJ/W8+zzZGvBkLqxAv0NVqDTi1/s/lK8j/o709W98
 sB5FqjSu8EJ4vweZwMpE7Eh5gkZ9nQ9YmQgsXTb6vk0QHA1s8StNRgVEzAY6CkmTjQjP
 wG3ILWpUEIcpNNcTxfxkPAV0wCRFqKr14+N+xYrKKafC4l3EGon96JY6a+aheyHxmAhP
 YTVIv763yq7zh8hBE1U61RraQCSIua8IGe6zfrH6JZnrbqPoxnyCqRlo/B2tnj/D5io9
 ag/e8Cbya/6jD9g7zhoxayaN+/PNezQmRh8IEi2lYHsNpOjXtfhgqT/7jGk1Bv0JM516
 htoQ==
X-Gm-Message-State: AO0yUKXeedPcvKcKKspBQRUiQH4iwfyMmbOoMmFnuzfhx9nNZdKpQTt5
 v5JRvwNFD/pUdnO+3g0+pigrgt9e11yiJyop8vD6NsHYLG5+dasfqL4rnf0Y+VCyFHlNNHAPnyj
 j92XbG1wYsC7Q1MhPTD5S7PUWGkhWVob7ow==
X-Received: by 2002:a05:6e02:1bee:b0:310:dff1:f55a with SMTP id
 y14-20020a056e021bee00b00310dff1f55amr7898152ilv.1.1675437586780; 
 Fri, 03 Feb 2023 07:19:46 -0800 (PST)
X-Google-Smtp-Source: AK7set9xS0+fDEKN1aTi0x42bIUmxvuWn31TlGlTEr16+4yc8RCliFt2/XQVRKmY908DNmVjPFwjDA==
X-Received: by 2002:a05:6e02:1bee:b0:310:dff1:f55a with SMTP id
 y14-20020a056e021bee00b00310dff1f55amr7898130ilv.1.1675437586483; 
 Fri, 03 Feb 2023 07:19:46 -0800 (PST)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 r6-20020a922a06000000b0031093e9c7fasm830954ile.85.2023.02.03.07.19.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Feb 2023 07:19:45 -0800 (PST)
Date: Fri, 3 Feb 2023 08:19:42 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: "Liu, Yi L" <yi.l.liu@intel.com>
Subject: Re: [PATCH v3] vfio: fix deadlock between group lock and kvm lock
Message-ID: <20230203081942.64fbf9f1.alex.williamson@redhat.com>
In-Reply-To: <DS0PR11MB75297154376388A3698C5CCAC3D79@DS0PR11MB7529.namprd11.prod.outlook.com>
References: <20230202162442.78216-1-mjrosato@linux.ibm.com>
 <20230202124210.476adaf8.alex.williamson@redhat.com>
 <BN9PR11MB527618E281BEB8E479ABB0418CD69@BN9PR11MB5276.namprd11.prod.outlook.com>
 <20230202161307.0c6aa23e.alex.williamson@redhat.com>
 <BN9PR11MB5276017F9CEBB4BAE58C40E88CD79@BN9PR11MB5276.namprd11.prod.outlook.com>
 <DS0PR11MB7529050661FCE4A5AC4B17C3C3D79@DS0PR11MB7529.namprd11.prod.outlook.com>
 <20230203064940.435e4d65.alex.williamson@redhat.com>
 <DS0PR11MB75297154376388A3698C5CCAC3D79@DS0PR11MB7529.namprd11.prod.outlook.com>
Organization: Red Hat
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
Cc: Matthew Rosato <mjrosato@linux.ibm.com>,
 "david@redhat.com" <david@redhat.com>, "Tian, Kevin" <kevin.tian@intel.com>,
 "imbrenda@linux.ibm.com" <imbrenda@linux.ibm.com>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "pasic@linux.ibm.com" <pasic@linux.ibm.com>, "jgg@nvidia.com" <jgg@nvidia.com>,
 "borntraeger@linux.ibm.com" <borntraeger@linux.ibm.com>, "Wang,
 Zhi A" <zhi.a.wang@intel.com>, "jjherne@linux.ibm.com" <jjherne@linux.ibm.com>,
 "farman@linux.ibm.com" <farman@linux.ibm.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "zhenyuw@linux.intel.com" <zhenyuw@linux.intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "frankja@linux.ibm.com" <frankja@linux.ibm.com>,
 "akrowiak@linux.ibm.com" <akrowiak@linux.ibm.com>,
 "pmorel@linux.ibm.com" <pmorel@linux.ibm.com>, "Christopherson, ,
 Sean" <seanjc@google.com>, "cohuck@redhat.com" <cohuck@redhat.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Fri, 3 Feb 2023 14:54:44 +0000
"Liu, Yi L" <yi.l.liu@intel.com> wrote:

> > From: Alex Williamson <alex.williamson@redhat.com>
> > Sent: Friday, February 3, 2023 9:50 PM
> >=20
> > On Fri, 3 Feb 2023 13:32:09 +0000
> > "Liu, Yi L" <yi.l.liu@intel.com> wrote:
> >  =20
> > > > From: Tian, Kevin <kevin.tian@intel.com>
> > > > Sent: Friday, February 3, 2023 10:00 AM
> > > > =20
> > > > > From: Alex Williamson <alex.williamson@redhat.com>
> > > > > Sent: Friday, February 3, 2023 7:13 AM
> > > > >
> > > > > On Thu, 2 Feb 2023 23:04:10 +0000
> > > > > "Tian, Kevin" <kevin.tian@intel.com> wrote:
> > > > > =20
> > > > > > > From: Alex Williamson <alex.williamson@redhat.com>
> > > > > > > Sent: Friday, February 3, 2023 3:42 AM
> > > > > > >
> > > > > > >
> > > > > > > LGTM.  I'm not sure moving the functions to vfio_main really =
buys =20
> > us =20
> > > > > > > anything since we're making so much use of group fields.  The=
 cdev
> > > > > > > approach will necessarily be different, so the bulk of the ge=
t code =20
> > will =20
> > > > > > > likely need to move back to group.c anyway.
> > > > > > > =20
> > > > > >
> > > > > > well my last comment was based on Matthew's v2 where the get =
=20
> > code =20
> > > > > > gets a kvm passed in instead of implicitly retrieving group ref=
_lock
> > > > > > internally. In that case the get/put helpers only contain devic=
e logic
> > > > > > thus fit in vfio_main.c.
> > > > > >
> > > > > > with v3 then they have to be in group.c since we don't want to =
use
> > > > > > group fields in vfio_main.c.
> > > > > >
> > > > > > but I still think v2 of the helpers is slightly better. The onl=
y difference
> > > > > > between cdev and group when handling this race is using differe=
nt
> > > > > > ref_lock. the symbol get/put part is exactly same. So even if w=
e
> > > > > > merge v3 like this, very likely Yi has to change it back to v2 =
style
> > > > > > to share the get/put helpers while just leaving the ref_lock pa=
rt
> > > > > > handled differently between the two path. =20
> > > > >
> > > > > I'm not really a fan of the asymmetry of the v2 version where the=
 get
> > > > > helper needs to be called under the new kvm_ref_lock, but the put
> > > > > helper does not.  Having the get helper handle that makes the cal=
ler
> > > > > much cleaner.  Thanks,
> > > > > =20
> > > >
> > > > What about passing the lock pointer into the helper? it's still sli=
ghtly
> > > > asymmetry as the put helper doesn't carry the lock pointer but it
> > > > could also be interpreted as if the pointer has been saved in the g=
et
> > > > then if it needs to be referenced by the put there is no need to pa=
ss
> > > > it in again. =20
> > >
> > > For cdev, I may modify vfio_device_get_kvm_safe() to accept
> > > struct kvm and let its caller hold a kvm_ref_lock (field within
> > > struct vfio_device_file). Meanwhile, the group path holds
> > > the group->kvm_ref_lock before invoking vfio_device_get_kvm_safe().
> > > vfio_device_get_kvm_safe() just includes the symbol get/put and
> > > the device->kvm and put_kvm set. =20
> >=20
> > Sounds a lot like v2 :-\  =20
>=20
> Yes, like v2. =F0=9F=98=8A
>=20
> > I'd look more towards group and cdev specific
> > helpers that handle the locking so that the callers aren't exposed to
> > the asymmetry of get vs put, and reduce a new
> > _vfio_device_get_kvm_safe() in common code that only does the symbol
> > work.  Thanks, =20
>=20
> If so, looks like Matthew needs a v4. I'm waiting for the final version
> of this patch and sending a new cdev series based on it. wish to see
> it soon ^_^.

cdev support is a future feature, why does it become a requirement for
a fix to the current base?  The refactoring could also happen in the
cdev series.  Thanks,

Alex

