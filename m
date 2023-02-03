Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A7C2B689A0D
	for <lists+intel-gvt-dev@lfdr.de>; Fri,  3 Feb 2023 14:49:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73AFE10E7A2;
	Fri,  3 Feb 2023 13:49:47 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA90010E7A2
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri,  3 Feb 2023 13:49:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675432185;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DMeV+PbsytnfwB8y571EgKoPuO8SIcRtHzLsbHY4Ecg=;
 b=h7wHtt70Y/5q4rfYhnw4XZgraJc5XL8WbkbLgArz6gjNUIiMWp4orZo3Qq5BszqQI6biIV
 XdllTxmfy9nCuKW16+kHV/WQKhhb0joY8ke5dDWFDU2gqJO+74hUpQZf7gr8rSScuRSmD2
 6n69SJd4X4V8xYNci0FAEG0tJsFkz0c=
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com
 [209.85.166.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-590-KCyeWNcTOz2nmB_52JyF5A-1; Fri, 03 Feb 2023 08:49:43 -0500
X-MC-Unique: KCyeWNcTOz2nmB_52JyF5A-1
Received: by mail-io1-f71.google.com with SMTP id
 n64-20020a6b8b43000000b00719e397eac0so3025379iod.14
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 03 Feb 2023 05:49:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:organization:references
 :in-reply-to:message-id:subject:cc:to:from:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=DMeV+PbsytnfwB8y571EgKoPuO8SIcRtHzLsbHY4Ecg=;
 b=pYEAxJxUVvjF3Bw5jv7eSDHGXOUMNymR9iBbqCnJFMSMC+ng7SrKpowVJ9HjnVKbcX
 1TsuWWLsgtag8WWw0LfjdUyRr2mISBzXWyA2pRzaTFCLjM7qt3KVat8bUFX6JgFLx4EP
 nEn26WDY02Cc6KtvjiPJqFINZ7Le1zgVx4IpDSAc+bm+FlaMhfY4rxZCnAL9hu9awYI7
 FqceAqIaTUvGJZ28WpDuJSw/qKHPEXefZfS5iC3BEhA4wXP1TTzb2uTIhtx9ra94I7jj
 m2Nzj9kGmS5Wso88spZApk1kdpALkRfma7H9Hg44eYMH7asjm/OMnTEGFdKctrccqouR
 KTDg==
X-Gm-Message-State: AO0yUKWoVI3n7hkE8jzjKueql+S2qWqcFwfrPoi/qKgqwD/l/BiSefbT
 iwvcCU0S1QhQJwczAO910XGJ9AZBoD8Wf1iXj6CaLaVUeDFB4juXc7YTJwV7gp8ds2YjBg1Xmvn
 P+ZdMFOjstzs477o0u762ACAm7RDxTFnfzg==
X-Received: by 2002:a05:6e02:b29:b0:312:75a8:befd with SMTP id
 e9-20020a056e020b2900b0031275a8befdmr7401942ilu.31.1675432183115; 
 Fri, 03 Feb 2023 05:49:43 -0800 (PST)
X-Google-Smtp-Source: AK7set+DXLFqJ2WVCxfMNKF0qA9WvYBQ4q7md2UoZyoOfbxX57I1uo2kCZVCiLHw1lEdIjP9+dyEFw==
X-Received: by 2002:a05:6e02:b29:b0:312:75a8:befd with SMTP id
 e9-20020a056e020b2900b0031275a8befdmr7401929ilu.31.1675432182869; 
 Fri, 03 Feb 2023 05:49:42 -0800 (PST)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 h22-20020a022b16000000b003a958069dbfsm853822jaa.8.2023.02.03.05.49.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Feb 2023 05:49:42 -0800 (PST)
Date: Fri, 3 Feb 2023 06:49:40 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: "Liu, Yi L" <yi.l.liu@intel.com>
Subject: Re: [PATCH v3] vfio: fix deadlock between group lock and kvm lock
Message-ID: <20230203064940.435e4d65.alex.williamson@redhat.com>
In-Reply-To: <DS0PR11MB7529050661FCE4A5AC4B17C3C3D79@DS0PR11MB7529.namprd11.prod.outlook.com>
References: <20230202162442.78216-1-mjrosato@linux.ibm.com>
 <20230202124210.476adaf8.alex.williamson@redhat.com>
 <BN9PR11MB527618E281BEB8E479ABB0418CD69@BN9PR11MB5276.namprd11.prod.outlook.com>
 <20230202161307.0c6aa23e.alex.williamson@redhat.com>
 <BN9PR11MB5276017F9CEBB4BAE58C40E88CD79@BN9PR11MB5276.namprd11.prod.outlook.com>
 <DS0PR11MB7529050661FCE4A5AC4B17C3C3D79@DS0PR11MB7529.namprd11.prod.outlook.com>
Organization: Red Hat
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Fri, 3 Feb 2023 13:32:09 +0000
"Liu, Yi L" <yi.l.liu@intel.com> wrote:

> > From: Tian, Kevin <kevin.tian@intel.com>
> > Sent: Friday, February 3, 2023 10:00 AM
> >   
> > > From: Alex Williamson <alex.williamson@redhat.com>
> > > Sent: Friday, February 3, 2023 7:13 AM
> > >
> > > On Thu, 2 Feb 2023 23:04:10 +0000
> > > "Tian, Kevin" <kevin.tian@intel.com> wrote:
> > >  
> > > > > From: Alex Williamson <alex.williamson@redhat.com>
> > > > > Sent: Friday, February 3, 2023 3:42 AM
> > > > >
> > > > >
> > > > > LGTM.  I'm not sure moving the functions to vfio_main really buys us
> > > > > anything since we're making so much use of group fields.  The cdev
> > > > > approach will necessarily be different, so the bulk of the get code will
> > > > > likely need to move back to group.c anyway.
> > > > >  
> > > >
> > > > well my last comment was based on Matthew's v2 where the get code
> > > > gets a kvm passed in instead of implicitly retrieving group ref_lock
> > > > internally. In that case the get/put helpers only contain device logic
> > > > thus fit in vfio_main.c.
> > > >
> > > > with v3 then they have to be in group.c since we don't want to use
> > > > group fields in vfio_main.c.
> > > >
> > > > but I still think v2 of the helpers is slightly better. The only difference
> > > > between cdev and group when handling this race is using different
> > > > ref_lock. the symbol get/put part is exactly same. So even if we
> > > > merge v3 like this, very likely Yi has to change it back to v2 style
> > > > to share the get/put helpers while just leaving the ref_lock part
> > > > handled differently between the two path.  
> > >
> > > I'm not really a fan of the asymmetry of the v2 version where the get
> > > helper needs to be called under the new kvm_ref_lock, but the put
> > > helper does not.  Having the get helper handle that makes the caller
> > > much cleaner.  Thanks,
> > >  
> > 
> > What about passing the lock pointer into the helper? it's still slightly
> > asymmetry as the put helper doesn't carry the lock pointer but it
> > could also be interpreted as if the pointer has been saved in the get
> > then if it needs to be referenced by the put there is no need to pass
> > it in again.  
> 
> For cdev, I may modify vfio_device_get_kvm_safe() to accept
> struct kvm and let its caller hold a kvm_ref_lock (field within
> struct vfio_device_file). Meanwhile, the group path holds
> the group->kvm_ref_lock before invoking vfio_device_get_kvm_safe().
> vfio_device_get_kvm_safe() just includes the symbol get/put and
> the device->kvm and put_kvm set.

Sounds a lot like v2 :-\  I'd look more towards group and cdev specific
helpers that handle the locking so that the callers aren't exposed to
the asymmetry of get vs put, and reduce a new
_vfio_device_get_kvm_safe() in common code that only does the symbol
work.  Thanks,

Alex

